Input Features Generation


•	Modeling:      

     Input Features	Predictor Model	Output Feature

•	Our input features: 
o	Vector
o	Host
o	Gene Sequence

•	Our output feature: Predicted expression level: {Low, Medium, High}

•	Gene sequence: 

o	Because we cannot apply the sequence directly in modeling, we convert it into some other features.
o	After literature review, I found this paper the most similar to our work, with the highest accuracy obtained ever (I call it “the reference paper”): “Learning to predict expression efficacy of vectors in recombinant protein production-2010”.
o	I decided to convert the gene sequence into the features listed in the reference paper. 
___________________________________________________________________________
 
Hirose 2011 & 2013
Group	#	Feature	Description	Size
-	1	Size of polypeptide
	-	1

Sequence Information: Nucleotide	2	Frequencies of four single nucleotides
	-	4 (*3=12)
	3	Frequencies of 64 codons
	-	64 (*3=192)
	4	GC contents
	-	1 (*3=3)

Sequence Information: Amino Acid	5	Frequencies of 20 single amino acids
	-	20 (*3=60)
	6	Frequencies of  chemical property groups (8 groups)
	-Aliphatic: [GALVI] 
-Aromatic: [FYW]
-Hydroxyl: [ST]
-Acidic: [DE]
-Amide: [NQ] 
-Basic: [RHK]
-Sulfur: [CM]
-Ring: [ P]
	8 (*3=24)
	7	Frequencies of  physical property groups (5 groups)
	-Nonpolar & hydrophilic: [GAVLIP]
-Polar & noncharged: [FWY]
-Polar & charged:
[STCMNQ]
-Negative charge:
[DE]
-Positive charge:
[RKH]
	5 (*3=15)
	8	Repeat: maximum number of consecutive same amino acids
	-	20 (*3=60)
	9	Repeat: maximum number of consecutive same chemical  property groups
	-	8 (*3=24)
	10	Repeat: maximum number of consecutive same physical property groups
	-	5 (*3=15)
Structural Information: Amino Acid	11	Frequencies of single amino acids in surface area
	The accessible surface area was predicted using RVPnet.
	20
	12	Frequencies of  chemical property groups in surface area
	-	8
	13	Frequencies of  physical property groups in surface area
	-	5
	14	Number of transmembrane regions 
	Predicted by TMHMM.	1
	15	Disordered regions:
	Predicted by POODLE-L.	-
		Number of occurrence
	-	1
		Length
	-	1
		Proportion
	Proportions in relation to the entire chain were computed.
	1
	16	Secondary structures
	-Predicted by PHD. 
-The ratio of each element to the entire chain was computed.
	-
		a-helix	
	1
		b-sheet	
	1
		others	
	1

 
437 features (1+396 + 40):

o	Size of polypeptide

o	Sequence information derived from nucleotide and amino acid sequence (396 features):
	Nucleotide:
•	Occurrence frequencies of four single nucleotides
•	64 codons
•	GC contents
	Amino acid:
•	Occurrence frequencies of 20 single amino acids
•	Chemical property groups (8 groups)
•	Repeat: maximum number of consecutive same amino acids
•	Repeat: maximum number of consecutive same chemical  property groups
	The values of these features were computed for the entire chains and both terminal regions, defined as 60 bases (20 amino acid residues), because modification of the terminal regions influences protein expression and solubility.
	The use of a His-tag fusion raises the possibility that the features in the N-terminal region of the in vivo E. coli expression system and the C-terminal region in the wheat germ cell-free expression system may not be evaluated properly. They considered the His-tag to have the same influence on any sequences, since they conducted the protein expression experiments under the same conditions. Therefore, they evaluated them under this hypothesis.

o	Structural information derived with several predictions using amino acid sequence (40 features):
	Transmembrane regions (predicted by TMHMM): the number of occurrences in the entire chain was computed
	Disordered regions (predicted by POODLE-L)
•	number of occurrences, 
•	lengths 
•	Proportions in relation to the entire chain were computed.
	Occurrence frequencies of single amino acids in surface area
	Physical property groups on the protein surface (The accessible surface area was predicted using RVPnet)
	Secondary structures (predicted by PHD): the ratio of each element to the entire chain was computed.

•	Selected feature vector size in E. coli: 64

•	The “structural information” had a strong influence at the protein expression stage:
o	Increased numbers of disordered regions and transmembrane regions prevented protein expression. In addition, the presence of charged residues on the protein surface had a positive effect on protein expression. 
o	These were common characteristics of globular proteins. For this reason, it may be important for a protein to fold into the proper structure at the protein expression stage.

•	Hirose 2013:
o	Nucleotide information: 
	No GC content or single nucleotide was selected in the in vivo E. coli, but 18 out of 61 codons were chosen to have significant contribution to protein expression. Only 3 rare-frequency codons in the E. coli, among eight tested, passed the Student’s t-test. Although it has been suggested that the codon usage influences protein expression, little correlation between rare codons and protein expression was detected in this study (Figure 4 in the paper).
Chan 2010

•	87 Features derived from entire recombinant fusion nucleic acid sequences: 
o	84 k-mer frequency features
o	Length
o	GC-content
o	CAI
 
1)	Nucleotide: <= 3-mer
2)	Nucleotide: sequence length
3)	Nucleotide: GC content
4)	Code Preference: Codon Adaptation Index
5)	Amino Acid: Isoelectric point
6)	Amino Acid: Peptide statistics
•	Number of residues (== Length of protein)
•	Average residue weight
•	Charge (== Net charge)
•	For each type of amino acid: number, molar percent, DayhoffStat
•	For each physico-chemical class of amino acid: number, molar percent
•	Probability of protein expression in E. coli inclusion bodies
•	Molar extinction coefficient (A280)
•	Extinction coefficient at 1 mg/ml (A280)
7)	PTMs
•	It is supposed to be obtained using the following link, but it does not work: http://ams2.bioinfo.pl/
•	I found the following links. Which one I can use and how?   
o	http://web.expasy.org/findmod/
o	http://web.expasy.org/peptide_mass/
o	http://csbl.bmb.uga.edu/~ffzhou/PTMP-UI/

8)	Amino Acid: (Idicula-Thomas, 2006)
•	Six physicochemical properties: 
o	GRAVY: Hydropathic index
o	AI: Aliphatic index
o	IIP: Instability index
o	IIN: Instability index of N-terminus
	If the protein has only one polypeptide chain, then the protein has only one N terminal end and one C-terminal end. Some proteins take a quaternary structure and so have more than one polypeptide in them. These proteins will have more N termini which is proportional to the no. of polypeptides (http://in.answers.yahoo.com/question/index?qid=20101231032345AAIyCzW)
•	Mono-peptide frequencies
•	Dipeptide frequencies
•	Reduced alphabet set:
o	Conformational similarity: 
	[CMQLEKRA],[P],[ND],[G],[HWFY],[S],[TIV]
o	Hydrophobicity
o		[CFILMVW],[AG],[PH],[EDRK],[NQSTY]
o	BLOSUM50 substitution matrix:
	[FWY],[CILMV],[H],[AG],[ST],[EDNQ],[KR],[P]

9)	Amino Acid: (Harrison, 1991)
•	Charge average approximation (Asp, Glu, Lys and Arg)
•	Turn-forming residue fraction (Asn, Gly, Pro and Ser)
•	Cysteine fractions
•	Proline fractions
•	Hydrophilicity
o	It seems that the available programs produce a range of values. How should I convert them into 1 number? 
o	For example using the following program: EMBOSS: pepinfo
•	Molecular weight (total number of residues)
o	Is it different with “molecular weight”?

Questions from authors of Chan’s paper:
•	Which features have you kept from “EMBOSS.pepstats”? 
o	The original features are: 
	Molecular weight
	Number of residues
	Average residue weight
	Charge
	Isoelectric point
	For each type of amino acid: number, molar percent, DayhoffStat
	For each physico-chemical class of amino acid: number, molar percent
	Probability of protein expression in E. coli inclusion bodies
	Molar extinction coefficient (A280)
	Extinction coefficient at 1 mg/ml (A280) 
o	I think you have ignored “isoelectric point” & “molecular weight”. 
	You listed “Isoelectric point” separately in “Table 2”. 
	For “molecular weight”, it must be under Wilkinson and Harrison (1991)’s features to have “6” features as you have indicated in “Table 2”.
o	But how have you kept the following 2 features and still have “8” features for “peptide statistics” as you indicated in “Table 2”:
	For each type of amino acid: number, molar percent, DayhoffStat (25*3=75)
	For each physico-chemical class of amino acid: number, molar percent (9*2=18)
•	How many residues have you considered to calculate “instability index of N-terminus”? (e.g. how many residues from the start of the protein chain)
 
Van der berg 2012

•	22 features in 4 categories (and the prediction results AUC on the last columns):
Features	Description	 hom       hom	het       het

Composition-based features
f0	ORF codon composition	0.85	0.70
f1	signal peptide AA composition	0.66	0.51
f2	mature protein AA composition	0.83	0.70
f3	buried-exposed composition	0.68	0.51
f4 (f4’)	buried AA composition	0.80	0.65
f5 (f5’)	exposed AA composition	0.82	0.64
f6	helix-strand-coil composition	0.62	0.57
f7 (f7’)	helix AA composition	0.68	0.60
f8 (f8)	strand AA composition	0.70	0.61
f9 (f9)	coil AA composition	0.80	0.65
f10	AA clusters composition	0.80	0.63
f11	optimized AA clusters comp.	0.83	0.67
Sequence-derived features
f12	codon usage	0.64	0.54
Selected features
f14	feature selection	0.84	0.75
Pattern-based features
f15	2-mer counts protein	0.82	0.63
f16	3-mer counts protein	0.77	0.61
f17	4-mer counts protein	0.68	0.60
f18	5-mer counts protein	0.57	0.47
f19	2-mer counts signal peptide	0.63	0.54
F20	3-mer counts signal peptide	0.59	0.52
F21	4-mer counts signal peptide	0.54	0.51
F22	5-mer counts signal peptide	0.56	0.50

o	Composition-based features were most predictive, but the exact representation (by codons, amino acids or amino acid clusters) had little influence. 
o	Taking into account predicted structural location of the amino acids did not further improve prediction results. 
o	Although all proteins have a signal peptide and the signal peptide is usually cleaved off in the ER, its sequence is still somewhat predictive. 
o	Composition based features were selected in the first iterations of feature selection. Mainly codons and only a few amino acid features were selected for het. In the first 3 iterations, only codons were selected, implying room for production improvement by codon adaptation of heterologous proteins.
o	Among the composition-based features, a number of individual amino acids had as strongly contributing, either positively or negatively.

