<?php
include "dbconn.php";
include "menu.php";
$balancetopay=0;

@$search=$_POST["search"];
?>
<table style="margin:auto;width:90%;" cellpadding="5" cellspacing="2">
<tr><th colspan='9'>Rental List<br />&nbsp;</th></tr>
<tr><th colspan='9' align="right"><form action='' method='POST'>Search by CustomerID/Customer Name/Vehicle Description<br /><input type='text' name='search' value='<?php echo $search;?>' maxlength='10'><input type='submit' value='Search'></form></th></tr></table>
<table style="margin:auto;border-collapse:collapse;" border="1" cellpadding="5" cellspacing="10">
<tr><th align='left'>Order Date</th><th align='left'>Vehicle ID</th><th align='left'>Vehicle Description</th><th align='left'>Customer ID</th><th align='left'>Customer Name</th><th align='left'>Start Date</th><th align='left'>Return Date</th><th align='left'>Total Amount</th><th align='left'>Payment Date</th></tr>
<?php
 $sql = "SELECT date_format(r.order_date,'%d-%b-%Y') as orderdate, v.vehicle_id as vehicleid, v.vehicle_description as vehicledescription, c.customer_id as customerid, c.customer_name as customername, date_format(r.start_date,'%d-%b-%Y') as startdate, date_format(r.return_date,'%d-%b-%Y') as returndate, date_format(r.payment_date,'%d-%b-%Y') as paymentdate, r.total_amount as totalamount  FROM vehicle_info v, customer_info c, rental_info r where v.vehicle_id=r.ref_vehicle_id and c.customer_id=r.ref_customer_id and (c.customer_id like '%".$search."%' or c.customer_name like '%".$search."%' or v.vehicle_id like '%".$search."%' or v.vehicle_description like '%".$search."%') order by r.total_amount desc";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
  
    echo "<tr><td>" . $row["orderdate"]. "</td><td>" . $row["vehicleid"]. "</td><td>" . $row["vehicledescription"]. "</td><td>" . $row["customerid"]. "</td><td>" . $row["customername"]. "</td><td>" . $row["startdate"]. "</td><td>" . $row["returndate"]. "</td><td align='right'>$".number_format($row["totalamount"],2)."</td><td align='right'>" . $row["paymentdate"]. "</td></tr>";
  }
} else {
  echo "0 results";
}
$conn->close();


?>


</tr>
</table>
