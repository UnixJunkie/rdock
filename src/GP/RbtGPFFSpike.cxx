/***********************************************************************
* $Id: //depot/dev/client3/rdock/2006.1/src/GP/RbtGPFFSpike.cxx#3 $
* Copyright (C) Vernalis (R&D) Ltd 2006
* This file is released under the terms of the End User License Agreement
* in ../../docs/EULA.txt
***********************************************************************/

#include "RbtGPFFSpike.h"
#include "RbtGPGenome.h"
#include "RbtGPParser.h"
#include "RbtParser.h"
#include "RbtDebug.h"
#include "RbtFilterExpression.h"
#include "RbtFilterExpressionVisitor.h"
#include "RbtCellTokenIter.h"
#include "RbtTokenIter.h"
#include <strstream>
#include <fstream>
#include <cassert>

RbtString RbtGPFFSpike::_CT("RbtGPFFSpike");
void RbtGPFFSpike::ReadTables(istream& in, RbtReturnTypeArray& it,
                              RbtReturnTypeArray& sft)
{
    RbtReturnType value;
    RbtInt nip, nsfi;
    RbtInt i = 0, j, recordn;
    in >> nip ;
    in.get();
    RbtInt nctes = 15;
    RbtGPGenome::SetNIP(nip+nctes);
    in >> nsfi;
    RbtGPGenome::SetNSFI(nsfi);
    in >> recordn;
    inputTable.clear();
    SFTable.clear();
    char name[80];
    CreateRandomCtes(nctes);
    while (!in.eof())
    {
        //read name, don't store it for now
        in.get();
        in.getline(name, 80, ',');
        in >> value;
        RbtReturnTypeList ivalues;
        ivalues.push_back(new RbtReturnType(value)); 
        for (j = 1 ; j < nip ; j++)
        {
            in.get();
            in >> value;
            ivalues.push_back(new RbtReturnType(value));
        }
        for (j = 0; j < nctes ; j++)
        {
            ivalues.push_back(new RbtReturnType(ctes[j]));
        }
        RbtReturnTypeList sfvalues;
        for (j = 0 ; j < nsfi ; j++)
        {
            in.get();
            in >> value;
            sfvalues.push_back(new RbtReturnType(value));
        }
        inputTable.push_back(RbtReturnTypeList(ivalues));
        SFTable.push_back(RbtReturnTypeList(sfvalues));
        i++;
        in >> recordn;
    }
    cout << "Read: " << inputTable[0][0] << endl;
    it = inputTable;
//	cout << it[0].size() << endl;
    sft = SFTable;

}

RbtDouble RbtGPFFSpike::CalculateFitness(RbtGPGenomePtr g, 
                                         RbtReturnTypeArray& it,
                                         RbtReturnTypeArray& sft,
                                         RbtBool function)
{
//    RbtGPParser p(RbtGPGenome::GetNIP(), RbtGPGenome::GetNIF(), 
//                RbtGPGenome::GetNN(), RbtGPGenome::GetNO());
    RbtReturnTypeList o;
    o.push_back(new RbtReturnType(1.1));
    RbtReturnType oldo;
    RbtDouble tot = 0.0;
    RbtDouble good = 0.0;
    RbtDouble bad = 0.0;
    RbtDouble hitlimit = 0.0;
    RbtGPChromosomePtr c(g->GetChrom());
        RbtParser p2;
        RbtCellTokenIterPtr ti(new RbtCellTokenIter(c, contextp));
        RbtFilterExpressionPtr fe(p2.Parse(ti, contextp));
//    RbtCellTokenIterPtr ti(new RbtCellTokenIter(c, contextp));
    for (RbtInt i = 0 ; i < it.size() ; i++)
    {
        RbtReturnTypeList inputs(it[i]);
        for (RbtInt j = 0 ; j < inputs.size() ; j++)
            contextp->Assign(j, *(inputs[j]));
        RbtReturnTypeList SFValues = sft[i];
        RbtDouble hit = *(SFValues[SFValues.size()-1]);
//        RbtParser p2;
//        RbtCellTokenIterPtr ti(new RbtCellTokenIter(c, contextp));
//        RbtFilterExpressionPtr fe(p2.Parse(ti, contextp));
        EvaluateVisitor visitor(contextp);
        fe->Accept(visitor);
        *(o[0]) = fe->GetValue();
		//cout << *(o[0]) << endl;
        for (RbtInt j = 0 ; j < RbtGPGenome::GetNO() ; j++)
            if (function)
            {
                cout << "Error, no function possible with spike\n";
                exit(1);
            }
            else
                if (*(o[j]) < 0.0) 
                {
                    if (hit < hitlimit)
                        good++; // += 1.2;
                    else
                        bad++;
                }
                else
                    if (hit >= hitlimit)
                        ;//good++;
                    else
                        good--;
//        c->Clear();
    }
        // objective value always an increasing function
    objective = good*1.5-bad;
    // For now, I am using tournament selection. So the fitness
    // function doesn't need to be scaled in any way
    fitness = objective; 
    g->SetFitness(fitness);
    return fitness;
} 
    
RbtDouble RbtGPFFSpike::CalculateFitness(
        RbtGPGenomePtr g, RbtReturnTypeArray& it,
        RbtReturnTypeArray& sft, RbtDouble hitlimit,RbtBool function)
{
//    RbtGPParser p(g->GetNIP(), g->GetNIF(), g->GetNN(), g->GetNO());
    RbtReturnTypeList o;
    o.push_back(new RbtReturnType(1.1));
    RbtReturnType oldo;
    RbtDouble truehits = 0.0;
    RbtDouble falsehits = 0.0;
    RbtDouble truemisses = 0.0;
    RbtDouble falsemisses = 0.0;
    RbtGPChromosomePtr c(g->GetChrom());
	    RbtParser p2;
        RbtTokenIterPtr ti(new RbtCellTokenIter(c, contextp));
        RbtFilterExpressionPtr fe(p2.Parse(ti, contextp));
    for (RbtInt i = 0 ; i < it.size() ; i++)
    {
        RbtReturnTypeList inputs = it[i];
        for (RbtInt j = 0 ; j < inputs.size() ; j++)
            contextp->Assign(j, *(inputs[j]));
        RbtReturnTypeList SFValues = sft[i];
        RbtDouble hit = *(SFValues[SFValues.size()-1]);
//        o = p.Parse(c, inputs);
//        oldo = *(o[0]);
//        RbtParser p2; //new RbtCellTokenIter(c, contextp));
//        RbtTokenIterPtr ti(new RbtCellTokenIter(c, contextp));
//        RbtFilterExpressionPtr fe(p2.Parse(ti, contextp));
        EvaluateVisitor visitor(contextp);
        fe->Accept(visitor);
        *(o[0]) = fe->GetValue();
//        cout << "** " << *(o[0]) << endl;
//        assert(oldo == *(o[0]));
        RbtDouble limit = 0.0;
        for (RbtInt j = 0 ; j < RbtGPGenome::GetNO() ; j++)
        {
            if (hit < hitlimit)
                if (*(o[j]) < limit)
                // true hit
                    truehits++;
                else
                    // false miss
                    falsemisses++;
            else
                if (*(o[j]) < limit)
                // false hit
                    falsehits++;
                else
                // true miss
                    truemisses++;
        }
//        c->Clear();
    }
        // objective value always an increasing function
    cout << truehits << "\t" << falsehits << "\t" << truemisses 
         << "\t" << falsemisses << endl;
    objective = truehits/(truehits+falsehits);
    fitness = objective;
    //g->SetFitness(fitness);
    // For now, I am using tournament selection. So the fitness
    // function doesn't need to be scaled in any way
    return fitness;
}
    
void RbtGPFFSpike::CreateRandomCtes(RbtInt nctes)
{
    if (ctes.size() == 0) // it hasn't already been initialized
    {
        RbtInt a, b;
        RbtDouble c;
        ctes.push_back(0.0);
        ctes.push_back(1.0);
        cout << "c0 \t0.0" << endl;
        cout << "c1 \t1.0" << endl;
        for (RbtInt i = 0 ; i < (nctes-2) ; i++)
        {
            a = m_rand.GetRandomInt(200) - 100;
            b = m_rand.GetRandomInt(10) - 5;
            c = (a/10.0)*pow(10,b);
            cout << "c" << i+2 << " \t" << c << endl;
            ctes.push_back(c);
        }
    }
}
