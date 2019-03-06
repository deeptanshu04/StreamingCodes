# StreamingCodes
Matlab Code to simulate packet loss rates of various streaming codes. Refer to the paper *Low Field-size, Rate-Optimal Streaming Codes for Channels with Burst and Random Erasures* for more details. 

### Brief Description of Files:
1. `construction_A, construction_C, construction_fong_khisti` : Output generator matrices for these 3 constructions.
2. `Fritchman_sim, GE_sim` : Simulate one channel use of Fritchman and GE channels respectively. Return next channel state and erasure/no erasure. 
3. `cauchygen`: outputs a Cauchy matrix of size a x b over a field of size 2^m .
4. `gen_burst_pattern` : outputs all burst erasure patterns of a length b within a window t.
5. `gen_k_sets`: outputs all sequences of length n containing k 1s and rest 0s (to model random erasures).
6. `check_valid_streaming` : To check if a particular generator matrix belongs to a valid streaming code. can also check for valid burst erasure correcting codes by setting `only_burst` input to 1.
7. `simulate_all_fast`: Simulate the different codes and outputs an array of packet loss rates. Contains functions to check if a codeword can be successfully decoded. 
8. `final_script_fast`: To run `simulate_all_fast` for multiple epsilons. 
9. mat files: Generator matrices for construction A and Random Code (Fong et al.) used in our simulation. 
10. `sw_erasure`: To check if an erasure pattern is a valid sliding window erasure pattern. 
11. `fritchman_uncoded_error`: To calculate packet loss rate expected of the Fritchman channel under no coding.
