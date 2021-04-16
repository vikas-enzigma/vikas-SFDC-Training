function validate(name,salut,first,last,dob,email,salary,job,country,state,status,date) {
    
    console.log('in helloworld');
    var cname = document.getElementById(name).value;
    var csalut = document.getElementById(salut).value;
    var cfirst = document.getElementById(first).value;
    var clast = document.getElementById(last).value;
    var cdob = document.getElementById(dob).value;
    var cemail = document.getElementById(email).value;
    var csalary = document.getElementById(salary).value;
    var cjob = document.getElementById(job).value;
    var ccountry = document.getElementById(country).value;
    var cstate = document.getElementById(state).value;
    var cstatus = document.getElementById(status).value;
    var cdate = document.getElementById(date).value;
    
    if( cname == '' ){
        alert("Insert Candidate Name before submit");
        
    }
    else if( csalut == '' ){
        alert("select salutaion before submit");
        
    }
    else if( cfirst == '' ){
        alert("Insert first name before submit");
        
    }
    else if( clast == '' ){
        alert("Insert last name before submit");
        
    }
    else if( cdob == '' ){
        alert("Insert Date of Birth before submit");
        
    }
    else if( cemail == '' ){
        alert("Insert Email Id before submit");
       
    }
    else if( csalary == '' ){
        alert("Insert salary before submit");
        
    }
    else if( cjob == '' ){
        alert("Select Job Type before submit");
        
    }
    else if( ccountry == '' ){
        alert("Select Country before submit");
       
    }
    else if( cstate == '' ){
        alert("Select State before submit");
       
    }
    else if( cstatus == '' ){
        alert("Select Status before submit");
       
    }
    else if( cdate == '' ){
        alert("Select Application Date before submit");
       
    }
    else{
        alert("Inserted Successfully!!!...");
        save();
    }
    
    
}