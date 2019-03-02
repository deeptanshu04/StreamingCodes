# StreamingCodes
Matlab Code to simulate packet loss rates of various streaming codes

Brief Description of Files:
1. construction_A, construction_C, construction_fong_khisti : Output generator matrices for these 3 constructions.
2. Fritchman_sim, GE_sim : Simulate one channel use of Fritchman and GE channels. Return next channel state and erasure/no erasure. 
3. cauchygen: outputs a Cauchy matrix of size a x b over a field of size 2^m .
4. gen_burst_pattern : all burst erasure patterns of a length b within a window t.
5. gen_k_sets: all sequenece of length n containing k 1s and rest 0s. To model random erasures.
6. check_valid_streaming : Check if a particular generator matrix belongs to a valid streaming code. can also check for valid burst erasure correcting codes by setting only_burst input to 1.
7. simulate_all_fast: Simulate the different codes and outputs an array of packet loss rates. 
8. final_script_fast: To run simulate_all_fast for multiple epsilons. 
