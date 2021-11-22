<?php
include "dbconn.php";
include "menu.php";
$balancetopay=0;
@$search=$_POST["search"];

?>
<table style="margin:auto;width:650px;"  cellpadding="5" cellspacing="10">
<tr><th colspan='5'>Customer List<br />&nbsp;</th></tr>
<tr><th colspan='5' align="right"><form action='' method='POST'>Search by ID/Name/Phone<br /><input type='text' name='search' value='<?php echo $search;?>' maxlength='10'><input type='submit' value='Search'></form></th></tr></table>
<table style="margin:auto;border-collapse:collapse;width:650px;" border="1" cellpadding="5" cellspacing="10">

<tr><th align='left'>Customer ID</th><th align='left'>Customer Name</th><th align='left'>Mobile Number</th><th align='left'>Balance to Pay</th></tr>
<?php
$sql = "SELECT customer_id, customer_name, customer_phone FROM customer_info where customer_id like '%".$search."%' or  customer_name like '%".$search."%' or  customer_phone like '%".$search."%'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
	 $sql1 = "SELECT sum(r.total_amount) as topay FROM rental_info r, customer_info c where c.customer_id=r.ref_customer_id and r.ref_customer_id='".$row["customer_id"]."' and r.payment_date is NULL";
$result1 = $conn->query($sql1);	
if ($result->num_rows > 0) {
	$row1 = $result1->fetch_assoc();
	$balancetopay=$row1["topay"];
	
}else
{
	$balancetopay=0;
}

	
	  
    echo "<tr><td>" . $row["customer_id"]. "</td><td>" . $row["customer_name"]. "</td><td>" . $row["customer_phone"]. "</td><td align='right'>$".number_format($balancetopay,2)."</td></tr>";
  }
} else {
  echo "0 results";
}
$conn->close();


?>


</tr>
</table>
