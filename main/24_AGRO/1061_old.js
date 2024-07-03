// Rewrite this code in js.Swap the new variables with the old ones.
// The new variables are the top ones.

this.ChangeCheckbox_1201 = function (itemId) {
    //alert("Test");
    var isChecked = document.getElementById(itemId).checked;
    //$.messager.alert("Warning", itemId, "warning");
    // I changed here
    // I changed here
   
    if (itemId === "33_1201_78465_1_1" && isChecked === true) {
        document.getElementById("33_1201_78466_2_1").checked = false; //This is new variable
        document.getElementById("33_1201_78467_3_1").checked = false; //This is new variable
        document.getElementById("33_1201_78468_4_1").checked = false; //This is new variable
        document.getElementById("33_1201_78469_5_1").checked = false; //This is new variable
        document.getElementById("33_1201_78470_6_1").checked = false; //This is new variable
        document.getElementById("33_1201_78471_7_1").checked = false; //This is new variable

    } 
    // You change the rest
    // Modify the rest

    else if (itemId == "26_1201_77316_2_1" && isChecked == true) { // New is 33_1201_78466_2_1 ane etc
        document.getElementById("26_1201_77315_1_1").checked = false; //This is old. Change the variables according to the top variables
        document.getElementById("26_1201_77317_3_1").checked = false; //This is old. Change the variables according to the top variables
        document.getElementById("26_1201_77318_4_1").checked = false; //This is old. Change the variables according to the top variables
        document.getElementById("26_1201_77319_5_1").checked = false; //This is old. Change the variables according to the top variables
        document.getElementById("26_1201_77320_6_1").checked = false; //This is old. Change the variables according to the top variables
        document.getElementById("26_1201_77321_7_1").checked = false; //This is old. Change the variables according to the top variables 
    }
    else if (itemId == "26_1201_77317_3_1" && isChecked == true) {
        document.getElementById("26_1201_77315_1_1").checked = false; //This is old. Change the variables according to the top variables
        document.getElementById("26_1201_77316_2_1").checked = false; //This is old. Change the variables according to the top variables
        document.getElementById("26_1201_77318_4_1").checked = false; //This is old. Change the variables according to the top variables
        document.getElementById("26_1201_77319_5_1").checked = false; //This is old. Change the variables according to the top variables
        document.getElementById("26_1201_77320_6_1").checked = false; //This is old. Change the variables according to the top variables
        document.getElementById("26_1201_77321_7_1").checked = false; //This is old. Change the variables according to the top variables
    }


    else if (itemId == "26_1201_77318_4_1" && isChecked == true) {
        document.getElementById("26_1201_77315_1_1").checked = false; //This is old. Change the variables according to the top variables
        document.getElementById("26_1201_77316_2_1").checked = false; //This is old. Change the variables according to the top variables
        document.getElementById("26_1201_77317_3_1").checked = false; //This is old. Change the variables according to the top variables
        document.getElementById("26_1201_77319_5_1").checked = false; //This is old. Change the variables according to the top variables
        document.getElementById("26_1201_77320_6_1").checked = false; //This is old. Change the variables according to the top variables
        document.getElementById("26_1201_77321_7_1").checked = false; //This is old. Change the variables according to the top variables
    }
    else if (itemId == "26_1201_77319_5_1" && isChecked == true) {
        document.getElementById("26_1201_77315_1_1").checked = false; //This is old. Change the variables according to the top variables
        document.getElementById("26_1201_77316_2_1").checked = false; //This is old. Change the variables according to the top variables
        document.getElementById("26_1201_77317_3_1").checked = false; //This is old. Change the variables according to the top variables
        document.getElementById("26_1201_77318_4_1").checked = false; //This is old. Change the variables according to the top variables
        document.getElementById("26_1201_77320_6_1").checked = false; //This is old. Change the variables according to the top variables
        document.getElementById("26_1201_77321_7_1").checked = false; //This is old. Change the variables according to the top variables
    }
    else if (itemId == "26_1201_77320_6_1" && isChecked == true) {
        document.getElementById("26_1201_77315_1_1").checked = false; //This is old. Change the variables according to the top variables
        document.getElementById("26_1201_77316_2_1").checked = false; //This is old. Change the variables according to the top variables
        document.getElementById("26_1201_77317_3_1").checked = false; //This is old. Change the variables according to the top variables
        document.getElementById("26_1201_77318_4_1").checked = false; //This is old. Change the variables accor ding to the top variables
        document.getElementById("26_1201_77319_5_1").checked = false; //This is old. Change the variables according to the top variables
        document.getElementById("26_1201_77321_7_1").checked = false; //This is old. Change the variables according to the top variables
    }
    else if (itemId == "26_1201_77321_7_1" && isChecked == true) {
        document.getElementById("26_1201_77315_1_1").checked = false; //This is old. Change the variables according to the top variables
        document.getElementById("26_1201_77316_2_1").checked = false; //This is old. Change the variables according to the top variables
        document.getElementById("26_1201_77317_3_1").checked = false; //This is old. Change the variables according to the top variables
        document.getElementById("26_1201_77318_4_1").checked = false; //This is old. Change the variables according to the top variables
        document.getElementById("26_1201_77319_5_1").checked = false; //This is old. Change the variables according to the top variables
        document.getElementById("26_1201_77320_6_1").checked = false; //This is old. Change the variables according to the top variables
    }

}