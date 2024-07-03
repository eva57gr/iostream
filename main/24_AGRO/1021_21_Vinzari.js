// Rewrite this code in js.Swap the new variables with the old ones.
// The new variables are the top ones.

this.ChangeCheckbox_1201 = function (itemId) {
    //alert("Test");
    var isChecked = document.getElementById(itemId).checked;
    //$.messager.alert("Warning", itemId, "warning");
    // I changed here

    if (itemId == "26_1201_77315_1_1" && isChecked == true) {
        document.getElementById("26_1201_77316_2_1").checked = false;
        document.getElementById("26_1201_77317_3_1").checked = false;
        document.getElementById("26_1201_77318_4_1").checked = false;
        document.getElementById("26_1201_77319_5_1").checked = false;
        document.getElementById("26_1201_77320_6_1").checked = false;
        document.getElementById("26_1201_77321_7_1").checked = false;
    }

    // You change the rest

    else if (itemId == "26_1201_77316_2_1" && isChecked == true) {
        document.getElementById("26_1201_77315_1_1").checked = false;
        document.getElementById("26_1201_77317_3_1").checked = false;
        document.getElementById("26_1201_77318_4_1").checked = false;
        document.getElementById("26_1201_77319_5_1").checked = false;
        document.getElementById("26_1201_77320_6_1").checked = false;
        document.getElementById("26_1201_77321_7_1").checked = false;
    }
    else if (itemId == "26_1201_77317_3_1" && isChecked == true) {
        document.getElementById("26_1201_77315_1_1").checked = false;
        document.getElementById("26_1201_77316_2_1").checked = false;
        document.getElementById("26_1201_77318_4_1").checked = false;
        document.getElementById("26_1201_77319_5_1").checked = false;
        document.getElementById("26_1201_77320_6_1").checked = false;
        document.getElementById("26_1201_77321_7_1").checked = false;
    }


    else if (itemId == "26_1201_77318_4_1" && isChecked == true) {
        document.getElementById("26_1201_77315_1_1").checked = false;
        document.getElementById("26_1201_77316_2_1").checked = false;
        document.getElementById("26_1201_77317_3_1").checked = false;
        document.getElementById("26_1201_77319_5_1").checked = false;
        document.getElementById("26_1201_77320_6_1").checked = false;
        document.getElementById("26_1201_77321_7_1").checked = false;
    }
    else if (itemId == "26_1201_77319_5_1" && isChecked == true) {
        document.getElementById("26_1201_77315_1_1").checked = false;
        document.getElementById("26_1201_77316_2_1").checked = false;
        document.getElementById("26_1201_77317_3_1").checked = false;
        document.getElementById("26_1201_77318_4_1").checked = false;
        document.getElementById("26_1201_77320_6_1").checked = false;
        document.getElementById("26_1201_77321_7_1").checked = false;
    }
    else if (itemId == "26_1201_77320_6_1" && isChecked == true) {
        document.getElementById("26_1201_77315_1_1").checked = false;
        document.getElementById("26_1201_77316_2_1").checked = false;
        document.getElementById("26_1201_77317_3_1").checked = false;
        document.getElementById("26_1201_77318_4_1").checked = false;
        document.getElementById("26_1201_77319_5_1").checked = false;
        document.getElementById("26_1201_77321_7_1").checked = false;
    }
    else if (itemId == "26_1201_77321_7_1" && isChecked == true) {
        document.getElementById("26_1201_77315_1_1").checked = false;
        document.getElementById("26_1201_77316_2_1").checked = false;
        document.getElementById("26_1201_77317_3_1").checked = false;
        document.getElementById("26_1201_77318_4_1").checked = false;
        document.getElementById("26_1201_77319_5_1").checked = false;
        document.getElementById("26_1201_77320_6_1").checked = false;
    }

}