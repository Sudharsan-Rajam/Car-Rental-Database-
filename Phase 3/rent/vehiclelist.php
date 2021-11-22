<?php
include "dbconn.php";
include "menu.php";
$balancetopay=0;

@$search=$_POST["search"];
?>
<table style="margin:auto;border-collapse:collapse;width:650px;" border="0" cellpadding="5" cellspacing="10">
<tr><th colspan='5'>Vehicle List<br />&nbsp;</th></tr>
<tr><th colspan='5' align="right"><form action='' method='POST'>Search by ID/Description<br /><input type='text' name='search' value='<?php echo $search;?>' maxlength='10'><input type='submit' value='Search'></form></th></tr></table>
<table style="margin:auto;border-collapse:collapse;" border="1" cellpadding="5" cellspacing="10">
<tr><th align='left'>Vehicle ID</th><th align='left'>Vehicle Description</th><th align='left'>Year</th><th align='left'>Availability Date</th><th align='right'>Avg Price</th></tr>
<?php
$sql = "SELECT vehicle_id, vehicle_description, vehicle_year FROM vehicle_info where vehicle_id like '%".$search."%' or vehicle_description like '%".$search."%'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
	 $sql1 = "SELECT date_format(max(a.return_date),'%d-%b-%Y') as returndate FROM vehicle_info v, availability_info a where v.vehicle_id=a.ref_vehicle_id and a.ref_vehicle_id='".$row["vehicle_id"]."'";
$result1 = $conn->query($sql1);	
if ($result->num_rows > 0) {
	$row1 = $result1->fetch_assoc();
	$balancetopay=$row1["returndate"];
	
}else
{
	$balancetopay=0;
}
 $sql2 = "select avg(r.total_amount) as avgtotalamount from rental_info r where r.rental_type = 1 and r.typref_vehicle_id='".$row["vehicle_id"]."' group by r.ref_vehicle_id";
$result2 = $conn->query($sql2);	
if ($result2->num_rows > 0) {
	$row2 = $result2->fetch_assoc();
	$avgtotalamount="$".number_format($row2["avgtotalamount"],2);
	
}else
{
	$avgtotalamount="Not Applicable";
}	
	  
    echo "<tr><td>" . $row["vehicle_id"]. "</td><td>" . $row["vehicle_description"]. "</td><td>" . $row["vehicle_year"]. "</td><td align='right'>".$balancetopay."</td><td align='right'>".$avgtotalamount."</td></tr>";
  }
} else {
  echo "0 results";
}
$conn->close();


?>


</tr>
</table>
