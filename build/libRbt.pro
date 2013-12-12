TEMPLATE	= lib
CONFIG		= dll warn_off release
HEADERS		= ../import/simplex/include/NMObjective.h \
		  ../import/simplex/include/NMSearch.h \
		  ../import/simplex/include/cmat.h \
		  ../import/simplex/include/maps_general.h \
		  ../import/simplex/include/subscrpt.h \
		  ../import/simplex/include/vec.h \
		  ../import/tnt/include/jama_cholesky.h \
		  ../import/tnt/include/jama_eig.h \
		  ../import/tnt/include/jama_lu.h \
		  ../import/tnt/include/jama_qr.h \
		  ../import/tnt/include/jama_svd.h \
		  ../import/tnt/include/tnt.h \
		  ../import/tnt/include/tnt_array1d.h \
		  ../import/tnt/include/tnt_array1d_utils.h \
		  ../import/tnt/include/tnt_array2d.h \
		  ../import/tnt/include/tnt_array2d_utils.h \
		  ../import/tnt/include/tnt_array3d.h \
		  ../import/tnt/include/tnt_array3d_utils.h \
		  ../import/tnt/include/tnt_cmat.h \
		  ../import/tnt/include/tnt_fortran_array1d.h \
		  ../import/tnt/include/tnt_fortran_array1d_utils.h \
		  ../import/tnt/include/tnt_fortran_array2d.h \
		  ../import/tnt/include/tnt_fortran_array2d_utils.h \
		  ../import/tnt/include/tnt_fortran_array3d.h \
		  ../import/tnt/include/tnt_fortran_array3d_utils.h \
		  ../import/tnt/include/tnt_i_refvec.h \
		  ../import/tnt/include/tnt_math_utils.h \
		  ../import/tnt/include/tnt_sparse_matrix_csr.h \
		  ../import/tnt/include/tnt_stopwatch.h \
		  ../import/tnt/include/tnt_subscript.h \
		  ../import/tnt/include/tnt_vec.h \
		  ../import/tnt/include/tnt_version.h \
		  ../include/GP/RbtCell.h \
		  ../include/GP/RbtCommand.h \
		  ../include/GP/RbtGPChromosome.h \
		  ../include/GP/RbtGPFFCHK1.h \
		  ../include/GP/RbtGPFFCrossDock.h \
		  ../include/GP/RbtGPFFGold.h \
		  ../include/GP/RbtGPFFHSP90.h \
		  ../include/GP/RbtGPFFSpike.h \
		  ../include/GP/RbtGPFitnessFunction.h \
		  ../include/GP/RbtGPGenome.h \
		  ../include/GP/RbtGPParser.h \
		  ../include/GP/RbtGPPopulation.h \
		  ../include/GP/RbtGPTypes.h \
		  ../include/RandInt.h \
		  ../include/Rbt.h \
		  ../include/RbtAlignTransform.h \
		  ../include/RbtAnnotation.h \
		  ../include/RbtAnnotationHandler.h \
		  ../include/RbtAromIdxSF.h \
		  ../include/RbtAtom.h \
		  ../include/RbtAtomFuncs.h \
		  ../include/RbtBaseBiMolTransform.h \
		  ../include/RbtBaseFileSink.h \
		  ../include/RbtBaseFileSource.h \
		  ../include/RbtBaseGrid.h \
		  ../include/RbtBaseIdxSF.h \
		  ../include/RbtBaseInterSF.h \
		  ../include/RbtBaseIntraSF.h \
		  ../include/RbtBaseMolecularDataSource.h \
		  ../include/RbtBaseMolecularFileSink.h \
		  ../include/RbtBaseMolecularFileSource.h \
		  ../include/RbtBaseObject.h \
		  ../include/RbtBaseSF.h \
		  ../include/RbtBaseTransform.h \
		  ../include/RbtBaseUniMolTransform.h \
		  ../include/RbtBiMolWorkSpace.h \
		  ../include/RbtBond.h \
		  ../include/RbtCavity.h \
		  ../include/RbtCavityFillSF.h \
		  ../include/RbtCavityGridSF.h \
		  ../include/RbtCellTokenIter.h \
		  ../include/RbtCharmmDataSource.h \
		  ../include/RbtCharmmTypesFileSource.h \
		  ../include/RbtChrom.h \
		  ../include/RbtChromDihedralElement.h \
		  ../include/RbtChromDihedralRefData.h \
		  ../include/RbtChromElement.h \
		  ../include/RbtChromFactory.h \
		  ../include/RbtChromOccupancyElement.h \
		  ../include/RbtChromOccupancyRefData.h \
		  ../include/RbtChromPositionElement.h \
		  ../include/RbtChromPositionRefData.h \
		  ../include/RbtCommands.h \
		  ../include/RbtConfig.h \
		  ../include/RbtConstSF.h \
		  ../include/RbtConstraint.h \
		  ../include/RbtContainers.h \
		  ../include/RbtContext.h \
		  ../include/RbtCoord.h \
		  ../include/RbtCrdFileSink.h \
		  ../include/RbtCrdFileSource.h \
		  ../include/RbtDebug.h \
		  ../include/RbtDihedralIntraSF.h \
		  ../include/RbtDihedralSF.h \
		  ../include/RbtDihedralTargetSF.h \
		  ../include/RbtDirectorySource.h \
		  ../include/RbtDockingError.h \
		  ../include/RbtDockingSite.h \
		  ../include/RbtElementFileSource.h \
		  ../include/RbtError.h \
		  ../include/RbtEuler.h \
		  ../include/RbtFFTGrid.h \
		  ../include/RbtFileError.h \
		  ../include/RbtFilter.h \
		  ../include/RbtFilterExpression.h \
		  ../include/RbtFilterExpressionVisitor.h \
		  ../include/RbtFlexAtomFactory.h \
		  ../include/RbtFlexData.h \
		  ../include/RbtFlexDataVisitor.h \
		  ../include/RbtGATransform.h \
		  ../include/RbtGenome.h \
		  ../include/RbtInteractionGrid.h \
		  ../include/RbtInteractionTemplate.h \
		  ../include/RbtLigandError.h \
		  ../include/RbtLigandFlexData.h \
		  ../include/RbtLigandSiteMapper.h \
		  ../include/RbtMOEGrid.h \
		  ../include/RbtMOL2FileSource.h \
		  ../include/RbtMdlFileSink.h \
		  ../include/RbtMdlFileSource.h \
		  ../include/RbtModel.h \
		  ../include/RbtModelError.h \
		  ../include/RbtModelMutator.h \
		  ../include/RbtNmrRestraintFileSource.h \
		  ../include/RbtNmrSF.h \
		  ../include/RbtNoeRestraint.h \
		  ../include/RbtNonBondedGrid.h \
		  ../include/RbtNonBondedHHSGrid.h \
		  ../include/RbtNullTransform.h \
		  ../include/RbtObserver.h \
		  ../include/RbtPMF.h \
		  ../include/RbtPMFDirSource.h \
		  ../include/RbtPMFGridSF.h \
		  ../include/RbtPMFIdxSF.h \
		  ../include/RbtPRMFactory.h \
		  ../include/RbtParamHandler.h \
		  ../include/RbtParameterFileSource.h \
		  ../include/RbtParser.h \
		  ../include/RbtPdbFileSource.h \
		  ../include/RbtPharmaSF.h \
		  ../include/RbtPlane.h \
		  ../include/RbtPolarIdxSF.h \
		  ../include/RbtPolarIntraSF.h \
		  ../include/RbtPolarSF.h \
		  ../include/RbtPopulation.h \
		  ../include/RbtPrincipalAxes.h \
		  ../include/RbtPseudoAtom.h \
		  ../include/RbtPsfFileSink.h \
		  ../include/RbtPsfFileSource.h \
		  ../include/RbtQuat.h \
		  ../include/RbtRand.h \
		  ../include/RbtRandLigTransform.h \
		  ../include/RbtRandPopTransform.h \
		  ../include/RbtRealGrid.h \
		  ../include/RbtReceptorFlexData.h \
		  ../include/RbtRequest.h \
		  ../include/RbtRequestHandler.h \
		  ../include/RbtResources.h \
		  ../include/RbtRotSF.h \
		  ../include/RbtSAIdxSF.h \
		  ../include/RbtSATypes.h \
		  ../include/RbtSFAgg.h \
		  ../include/RbtSFFactory.h \
		  ../include/RbtSFRequest.h \
		  ../include/RbtSetupPMFSF.h \
		  ../include/RbtSetupPolarSF.h \
		  ../include/RbtSetupSASF.h \
		  ../include/RbtSimAnnTransform.h \
		  ../include/RbtSimplexTransform.h \
		  ../include/RbtSiteMapper.h \
		  ../include/RbtSiteMapperFactory.h \
		  ../include/RbtSmartPointer.h \
		  ../include/RbtSmarts.h \
		  ../include/RbtSolventFlexData.h \
		  ../include/RbtSphereSiteMapper.h \
		  ../include/RbtStringTokenIter.h \
		  ../include/RbtSubject.h \
		  ../include/RbtTetherSF.h \
		  ../include/RbtToken.h \
		  ../include/RbtTokenIter.h \
		  ../include/RbtTransformAgg.h \
		  ../include/RbtTransformFactory.h \
		  ../include/RbtTriposAtomType.h \
		  ../include/RbtTypes.h \
		  ../include/RbtVariant.h \
		  ../include/RbtVble.h \
		  ../include/RbtVdwGridSF.h \
		  ../include/RbtVdwIdxSF.h \
		  ../include/RbtVdwIntraSF.h \
		  ../include/RbtVdwSF.h \
		  ../include/RbtWorkSpace.h \
		  ../include/Singleton.h
SOURCES		= ../import/simplex/src/NMSearch.cxx \
		  ../src/GP/RbtGPChromosome.cxx \
		  ../src/GP/RbtGPFFCHK1.cxx \
		  ../src/GP/RbtGPFFCrossDock.cxx \
		  ../src/GP/RbtGPFFGold.cxx \
		  ../src/GP/RbtGPFFHSP90.cxx \
		  ../src/GP/RbtGPFFSpike.cxx \
		  ../src/GP/RbtGPFitnessFunction.cxx \
		  ../src/GP/RbtGPGenome.cxx \
		  ../src/GP/RbtGPParser.cxx \
		  ../src/GP/RbtGPPopulation.cxx \
		  ../src/lib/Rbt.cxx \
		  ../src/lib/RbtAlignTransform.cxx \
		  ../src/lib/RbtAnnotation.cxx \
		  ../src/lib/RbtAnnotationHandler.cxx \
		  ../src/lib/RbtAromIdxSF.cxx \
		  ../src/lib/RbtAtom.cxx \
		  ../src/lib/RbtAtomFuncs.cxx \
		  ../src/lib/RbtBaseBiMolTransform.cxx \
		  ../src/lib/RbtBaseFileSink.cxx \
		  ../src/lib/RbtBaseFileSource.cxx \
		  ../src/lib/RbtBaseGrid.cxx \
		  ../src/lib/RbtBaseIdxSF.cxx \
		  ../src/lib/RbtBaseInterSF.cxx \
		  ../src/lib/RbtBaseIntraSF.cxx \
		  ../src/lib/RbtBaseMolecularFileSink.cxx \
		  ../src/lib/RbtBaseMolecularFileSource.cxx \
		  ../src/lib/RbtBaseObject.cxx \
		  ../src/lib/RbtBaseSF.cxx \
		  ../src/lib/RbtBaseTransform.cxx \
		  ../src/lib/RbtBaseUniMolTransform.cxx \
		  ../src/lib/RbtBiMolWorkSpace.cxx \
		  ../src/lib/RbtBond.cxx \
		  ../src/lib/RbtCavityFillSF.cxx \
		  ../src/lib/RbtCavityGridSF.cxx \
		  ../src/lib/RbtCellTokenIter.cxx \
		  ../src/lib/RbtCharmmDataSource.cxx \
		  ../src/lib/RbtCharmmTypesFileSource.cxx \
		  ../src/lib/RbtChrom.cxx \
		  ../src/lib/RbtChromDihedralElement.cxx \
		  ../src/lib/RbtChromDihedralRefData.cxx \
		  ../src/lib/RbtChromElement.cxx \
		  ../src/lib/RbtChromFactory.cxx \
		  ../src/lib/RbtChromOccupancyElement.cxx \
		  ../src/lib/RbtChromOccupancyRefData.cxx \
		  ../src/lib/RbtChromPositionElement.cxx \
		  ../src/lib/RbtChromPositionRefData.cxx \
		  ../src/lib/RbtConstSF.cxx \
		  ../src/lib/RbtConstraint.cxx \
		  ../src/lib/RbtContext.cxx \
		  ../src/lib/RbtCrdFileSink.cxx \
		  ../src/lib/RbtCrdFileSource.cxx \
		  ../src/lib/RbtDebug.cxx \
		  ../src/lib/RbtDihedralIntraSF.cxx \
		  ../src/lib/RbtDihedralSF.cxx \
		  ../src/lib/RbtDihedralTargetSF.cxx \
		  ../src/lib/RbtDirectorySource.cxx \
		  ../src/lib/RbtDockingSite.cxx \
		  ../src/lib/RbtElementFileSource.cxx \
		  ../src/lib/RbtEuler.cxx \
		  ../src/lib/RbtFFTGrid.cxx \
		  ../src/lib/RbtFilter.cxx \
		  ../src/lib/RbtFilterExpression.cxx \
		  ../src/lib/RbtFilterExpressionVisitor.cxx \
		  ../src/lib/RbtFlexAtomFactory.cxx \
		  ../src/lib/RbtGATransform.cxx \
		  ../src/lib/RbtGenome.cxx \
		  ../src/lib/RbtInteractionGrid.cxx \
		  ../src/lib/RbtLigandFlexData.cxx \
		  ../src/lib/RbtLigandSiteMapper.cxx \
		  ../src/lib/RbtMOEGrid.cxx \
		  ../src/lib/RbtMOL2FileSource.cxx \
		  ../src/lib/RbtMdlFileSink.cxx \
		  ../src/lib/RbtMdlFileSource.cxx \
		  ../src/lib/RbtModel.cxx \
		  ../src/lib/RbtModelMutator.cxx \
		  ../src/lib/RbtNmrRestraintFileSource.cxx \
		  ../src/lib/RbtNmrSF.cxx \
		  ../src/lib/RbtNoeRestraint.cxx \
		  ../src/lib/RbtNonBondedGrid.cxx \
		  ../src/lib/RbtNonBondedHHSGrid.cxx \
		  ../src/lib/RbtNullTransform.cxx \
		  ../src/lib/RbtObserver.cxx \
		  ../src/lib/RbtPMF.cxx \
		  ../src/lib/RbtPMFDirSource.cxx \
		  ../src/lib/RbtPMFGridSF.cxx \
		  ../src/lib/RbtPMFIdxSF.cxx \
		  ../src/lib/RbtPRMFactory.cxx \
		  ../src/lib/RbtParamHandler.cxx \
		  ../src/lib/RbtParameterFileSource.cxx \
		  ../src/lib/RbtParser.cxx \
		  ../src/lib/RbtPdbFileSource.cxx \
		  ../src/lib/RbtPharmaSF.cxx \
		  ../src/lib/RbtPolarIdxSF.cxx \
		  ../src/lib/RbtPolarIntraSF.cxx \
		  ../src/lib/RbtPolarSF.cxx \
		  ../src/lib/RbtPopulation.cxx \
		  ../src/lib/RbtPrincipalAxes.cxx \
		  ../src/lib/RbtPseudoAtom.cxx \
		  ../src/lib/RbtPsfFileSink.cxx \
		  ../src/lib/RbtPsfFileSource.cxx \
		  ../src/lib/RbtRand.cxx \
		  ../src/lib/RbtRandLigTransform.cxx \
		  ../src/lib/RbtRandPopTransform.cxx \
		  ../src/lib/RbtRealGrid.cxx \
		  ../src/lib/RbtReceptorFlexData.cxx \
		  ../src/lib/RbtRotSF.cxx \
		  ../src/lib/RbtSAIdxSF.cxx \
		  ../src/lib/RbtSATypes.cxx \
		  ../src/lib/RbtSFAgg.cxx \
		  ../src/lib/RbtSFFactory.cxx \
		  ../src/lib/RbtSetupPMFSF.cxx \
		  ../src/lib/RbtSetupPolarSF.cxx \
		  ../src/lib/RbtSetupSASF.cxx \
		  ../src/lib/RbtSimAnnTransform.cxx \
		  ../src/lib/RbtSimplexTransform.cxx \
		  ../src/lib/RbtSiteMapper.cxx \
		  ../src/lib/RbtSiteMapperFactory.cxx \
		  ../src/lib/RbtSolventFlexData.cxx \
		  ../src/lib/RbtSphereSiteMapper.cxx \
		  ../src/lib/RbtStringTokenIter.cxx \
		  ../src/lib/RbtSubject.cxx \
		  ../src/lib/RbtTetherSF.cxx \
		  ../src/lib/RbtToken.cxx \
		  ../src/lib/RbtTransformAgg.cxx \
		  ../src/lib/RbtTransformFactory.cxx \
		  ../src/lib/RbtTriposAtomType.cxx \
		  ../src/lib/RbtVdwGridSF.cxx \
		  ../src/lib/RbtVdwIdxSF.cxx \
		  ../src/lib/RbtVdwIntraSF.cxx \
		  ../src/lib/RbtVdwSF.cxx \
		  ../src/lib/RbtWorkSpace.cxx
VERSION		= rdock-code.0
INCLUDEPATH	= ../include;../include/GP;../import/simplex/include;../import/tnt/include
DEPENDPATH	= $INCLUDEPATH
DEFINES		+= _NDEBUG
TARGET		= Rbt
OBJECTS_DIR	= linux-g++-64/release/obj
DESTDIR		= linux-g++-64/release/lib