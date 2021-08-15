# parse constr and ID coeffs for constr.mat
parse_constr <- function(constr1){
  constr.in = str_replace_all(constr1, "\\*?x\\d+", "x") %>% 
    str_extract_all(., "[-]?\\s?\\d+") %>% unlist() %>% 
    str_replace_all(., "\\s", "") %>%
    unlist() %>% as.numeric()
  return(constr.in)}

parse_obj_fn <- function(str1){
  obj.in = str_replace_all(str1, "[\\*\\s]?x\\d+", "x") %>% 
    str_extract_all(., "[-]?\\s?\\d+x") %>% unlist() %>%
    str_extract_all("[-]?\\d+") %>% 
    unlist() %>% as.numeric()
  return(obj.in)}