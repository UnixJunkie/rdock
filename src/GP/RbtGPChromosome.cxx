/***********************************************************************
* $Id: //depot/dev/client3/rdock/2006.1/src/GP/RbtGPChromosome.cxx#3 $
* Copyright (C) Vernalis (R&D) Ltd 2006
* This file is released under the terms of the End User License Agreement
* in ../../docs/EULA.txt
***********************************************************************/

#include "RbtGPChromosome.h"
#include "RbtCommand.h"
#include "RbtCell.h"

#include <fstream.h>

RbtString RbtGPChromosome::_CT("RbtGPChromosome");

// Constructors
RbtGPChromosome::RbtGPChromosome(RbtInt npi, RbtInt nfi, RbtInt nn, 
                                 RbtInt no, RbtInt nr, RbtInt nc)
{
    chrom = RbtIntList(nn * (nfi + 1) + no);
    RbtInt i = 0, n;
    nProgramInputs = npi;
    nFunctionsInputs = nfi;
    RbtInt ncells = nn + npi; // number of nodes + inputs
    nProgramOutputs = no;
    nColumns = nc;
    nRows = nr;
    cells = RbtCellList(ncells);
    for (RbtInt i = 0 ; i < ncells ; i++)
        cells[i] = new RbtCell();

}
RbtGPChromosome::RbtGPChromosome(const RbtGPChromosome& c)
{
    chrom = RbtIntList(c.chrom.size());
    cells = RbtCellList(c.cells.size());
    for (RbtInt i = 0 ; i < cells.size() ; i++)
        cells[i] = c.cells[i];
    for (RbtInt i = 0 ; i < chrom.size() ; i++)
        chrom[i] = c.chrom[i];
    nProgramInputs = c.nProgramInputs;
    nFunctionsInputs = c.nFunctionsInputs;
    nProgramOutputs = c.nProgramOutputs;
}

///////////////////
// Destructor
//////////////////
RbtGPChromosome::~RbtGPChromosome(){}

void RbtGPChromosome::Clear()
{
    for (RbtInt i = 0 ; i < cells.size() ; i++)
        cells[i]->Clear();
    RbtCommand::Clear();
}
RbtGPChromosome& RbtGPChromosome::operator=(const RbtGPChromosome& c)
{
    for (RbtInt i = 0 ; i < cells.size() ; i++)
        *(cells[i]) = *(c.cells[i]);
    for (RbtInt i = 0 ; i < chrom.size() ; i++)
        chrom[i] = c.chrom[i];
    nProgramInputs = c.nProgramInputs;
    nFunctionsInputs = c.nFunctionsInputs;
    nProgramOutputs = c.nProgramOutputs;
}

istream& operator>>(istream& s, RbtGPChromosome &p)
{
    for (RbtInt i = 0 ; i < p.chrom.size() ; i++)
        s >> p.chrom[i];
    RbtInt cell; 
	RbtReturnType value;
    while (!s.eof())
    {
        s >> cell >> value;
        p.Cells(cell)->SetConstant(value);
    }
}
  
ostream& RbtGPChromosome::Print(ostream& s) const
{
    RbtInt g = 0;
    for (RbtInt i = 0 ; i < nColumns ; i++)
    {
        for (RbtInt j = 0 ; j < nRows ; j++)
        {
            for (RbtInt k = 0 ; k <= nFunctionsInputs ; k++)
                s << chrom[g++] << " ";
            s << "\t";
        }
        s << endl;
    }
    for (RbtInt i = 0 ; i < nProgramOutputs ; i++)
        s << chrom[g++] << " ";
    s << endl;
    for (RbtInt i = 0 ; i < cells.size() ; i++)
        if (cells[i]->Constant())
            s << i << "\t" << cells[i]->GetResult() << endl;
    return s;
}

ostream& operator<<(ostream& s, const RbtGPChromosome &p)
{
    p.Print(s);
    return s;
}

void RbtGPChromosome::SetConstant(RbtReturnType cte, RbtInt idx)
{
    RbtInt cell = idx / (nFunctionsInputs + 1) + nProgramInputs;
//    cout << cell << endl;
    cells[cell]->SetConstant(cte);
}

void RbtGPChromosome::ResetConstant(RbtInt idx)
{
    RbtInt cell = idx / (nFunctionsInputs + 1) + nProgramInputs;
//    cout << cell << endl;
    cells[cell]->ResetConstant();
    if (cells[cell]->Evaluated())
        cells[cell]->ResetConstant();
}
