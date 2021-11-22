<?php
include "menu.php";
include "dbconn.php";
?>
<form method="post" action="rentavehiclesave.php">
<table style="margin:auto;width:500px;"  cellpadding="5" cellspacing="10">
<tr><th colspan='2'>Book a Vehicle<br />&nbsp;</th></tr>
<tr><th align='left'>Vehicle Number</th><td colspan='2'>
<select name='vehicleid'>
<?php
$sql = "select (v.vehicle_id) as vehicleid, v.vehicle_description from  vehicle_info v ";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
  echo "<option value='".$row["vehicleid"]."'>".$row["vehicleid"]." - ".$row["vehicle_description"]."</option>";
  }
  }
	  ?>
</select>
</td></tr>
<tr><th align='left'>Rent Period</th><td>From<br /><input type='date' name='fromdate' placeholder="YYYY-MM-DD"></td></tr>
<tr><th align='left'>Customer ID</th><td colspan='2'>
<select name='customerid'>
<?php
$sql = "select c.customer_id as customerid, c.customer_name as customername from customer_info c inner join r.rental_info on c.customer_id = r.customer_id where Rent Period is not between start_date and return_date ";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
  echo "<option value='".$row["customerid"]."'>".$row["customerid"]." - ".$row["customername"]."</option>";
  }
  }
	  ?>
</select></td></tr>
<tr><th align='left'>Rent Type</th><td><select name='renttype'><option>Select</option><option value='1'>Daily</option><option value='7'>Weekly</option></select></td></tr>

<tr><th>Quantity</th><td><input type='text' name='rentqty' Value='1' size='2'></td></tr>
<tr><th colspan='2' align="center"><input type='Submit' Value='Book'></th></tr>

</table>
</tr>
</table>
</form>