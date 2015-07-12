// Specify the normal table row background color
//   and the background color for when the mouse 
//   hovers over the table row.

var TableBackgroundNormalColor = "#ffffff";
var TableBackgroundMouseoverColor = "#9999ff";

// These two functions need no customization.
function ChangeBackgroundColor(row) { row.style.backgroundColor = TableBackgroundMouseoverColor; }
function RestoreBackgroundColor(row) { row.style.backgroundColor = TableBackgroundNormalColor; }
