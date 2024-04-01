var from = "";

$(document).ready(function () {
    form = $("#formDenShort").val();
    f1_cap2_inf_16_agro();
});

$(function () {
    // OnKeyPress ```````````````````````````````````````````````````````````````````````````````
    $("input:not([type='button']):not([readonly]):not([disabled])").on("change", function (e) {
        f1_cap2_inf_16_agro();
    });
});


function f1_cap2_inf_16_agro() {

    //alert("test");

    var R0010_C1 = $("#36_385_78183_0010_1");
    var R0010_C2 = $("#36_385_78183_0010_2");
   
    
    // Este cod in js scrie in continuare 
    //Daca R0010_C1  este mai mare ca zero si R0010_C2 este egal cu zero sau nu este completata 
    //Sa afiseze mesaj de tip alert 'Eroarea' si invers 

    // Check conditions and display alert message if condition is met
    if ((parseInt(R0010_C1.val()) > 0 && (parseInt(R0010_C2.val()) === 0 || R0010_C2.val() === "")) ||
        (parseInt(R0010_C2.val()) > 0 && (parseInt(R0010_C1.val()) === 0 || R0010_C1.val() === ""))) {
        alert("Cap. II Daca COL1 <> 0, atunci COL2 <> 0 si invers");
    }
    
}

