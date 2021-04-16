function validate(name,type,manager,position,salary,exp,skills,qualification,certification) {
    console.log('in helloworld');
    var jname = document.getElementById(name).value;
    var jtype = document.getElementById(type).value;
    var jmanager = document.getElementById(manager).value;
    var jpositions = document.getElementById(position).value;
    var jexpiry = document.getElementById(exp).value;
    var jsalary = document.getElementById(salary).value;
    var jskills = document.getElementById(skills).value;
    var jqualification = document.getElementById(qualification).value;
    var jcertification = document.getElementById(certification).value;
    
    if( jname == '' ){
        alert("Insert Job Name before submit");
        
    }
    else if( jtype == '' ){
        alert("Insert jobtype before submit");
        
    }
    else if( jmanager == '' ){
        alert("Insert jmanager before submit");
        
    }
    else if( jpositions == '' ){
        alert("Insert No of Positions before submit");
        
    }
    else if( jsalary == '' ){
        alert("Insert salary before submit");
        
    }
    else if( jexpiry == '' ){
        alert("Insert expiry date before submit");
       
    }
    else if( jskills == '' ){
        alert("Insert skills before submit");
        
    }
    else if( jqualification == '' ){
        alert("Insert qualification before submit");
        
    }
    else if( jcertification == '' ){
        alert("Insert certification before submit");
       
    }
    else{
        alert("Inserted Successfully!!!...");
        //document.getElementById('{!$Component.theForm.thePageBlock.pbInput.btn}').disabled = false;
        save();
    }
    
    
}