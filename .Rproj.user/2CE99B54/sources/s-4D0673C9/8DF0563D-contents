shinyServer(function(input,output,session){
  
  
  # 
  # constr.mat = reactive({
  #   matrix(0, nrow=input$n1, ncol=input$n0)
  # })
  # 
  # constr.rhs = reactive({
  #   matrix(0, nrow=input$n1, ncol=1)
  #   })
  # 
  # constr.dir = reactive({
  #   vector(mode="list", length=input$n1)
  #   })# Const.dir<-c("<","<=")
  
# Generate n text input UI for 
  output$consCtrl <- renderUI({
    lapply(1:input$n1, function(i) {
      textInput(inputId = paste0("tex_",i),label = paste0("Constraint ", i))
      #strong(paste0('Hi, this is output B#', i),br())
    })
  })
  
# parse objective function
  output$objfn <- renderPrint({
    parse_constr(input$obj_str)
  })

const_vector <- reactive({
  const_vector = c()
  for(i in 1:input$n1){
   const_vector[i] <- c(input[[paste0("tex_",i)]])
  }
  return(const_vector)
})

#op
  output$op <- renderPrint({

    constr.mat = matrix(0, nrow=input$n1, ncol=input$n0);constr.mat
    constr.rhs = matrix(0, nrow=input$n1, ncol=1);constr.rhs
    constr.dir = vector(mode="list", length=input$n1);constr.dir  # Const.dir<-c("<","<=")
    obj.in = parse_obj_fn(input$obj_str);obj.in
    for (i0 in 1:input$n1){
      a0 = parse_constr(const_vector()[i0])
      constr.mat[i0, 1:input$n0] = a0[1:input$n0]
      constr.rhs[i0, 1] = a0[length(a0)]
      constr.dir[i0] = str_extract_all(const_vector()[i0], "[<>=]")[[1]] %>%
        str_c(collapse="") %>% unlist()
    }
    constr.dir = constr.dir %>% unlist()
    
    if (input$int0){
      optimum <- lp(direction=input$obj_type, obj.in, constr.mat, constr.dir, constr.rhs, all.int=T)
      
    } else {
     optimum <- lp(direction=input$obj_type, obj.in, constr.mat, constr.dir, constr.rhs)
    }

    output$op1 <- renderPrint(optimum)
    
    # prep output for display
    varnames0 = vector(mode="list", length=input$n0)
    for (i in 1:input$n0){varnames0[i] = paste0("x",i)}
    varnames0 = varnames0 %>% unlist()

    solution_df = data.frame(variable = varnames0, value = optimum$solution)
    solution_df  # display this
  })

  
  
  
})
