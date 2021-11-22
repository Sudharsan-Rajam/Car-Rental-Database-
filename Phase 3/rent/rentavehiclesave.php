<?php

include "dbconn.php";

$vehicleid=$_POST["vehicleid"];
$fromdate=$_POST["fromdate"];
$rentqty=$_POST["rentqty"];
$customerid=$_POST["customerid"];
$renttype=$_POST["renttype"];
$renttype1="+ ".(int)$renttype." days";


$todate=date('Y-m-d', strtotime($fromdate. $renttype1));

$sql = "select c.customer_id as customerid, c.customer_name as customername from customer_info c inner join r.rental_info on c.customer_id = r.customer_id where Rent Period is not between start_date and return_date ";
$result = $conn->query($sql);

 $insquery="insert into availability_info (ref_vehicle_id, start_date, return_date, no_of_days) values ('".$vehicleid."','".$fromdate."','".$todate."',DATEDIFF('".$todate."','".$fromdate."'))";
$result = $conn->query($insquery);


 $selvehicletypcat="select vehicle_type as vehicletype, vehicle_category as vehiclecategory from vehicle_info where vehicle_id='".$vehicleid."'";
$resselvehicletypcat = $conn->query($selvehicletypcat);
if ($resselvehicletypcat->num_rows > 0) {
  // output data of each row
  while($rowselvehicletypcat = $resselvehicletypcat->fetch_assoc()) {
	 $vehicletype= $rowselvehicletypcat["vehicletype"];
	 $vehiclecategory= $rowselvehicletypcat["vehiclecategory"];
  }
 if ($vehicletype==1 and $vehiclecategory==0) $rent=100;
 else if ($vehicletype==1 and $vehiclecategory==1) $rent=150;
 else if ($vehicletype==2 and $vehiclecategory==0) $rent=150;
 else if ($vehicletype==2 and $vehiclecategory==1) $rent=150;
 else if ($vehicletype==3 and $vehiclecategory==0) $rent=150;
 else if ($vehicletype==3 and $vehiclecategory==1) $rent=150;
 else if ($vehicletype==4 and $vehiclecategory==0) $rent=150;
 else if ($vehicletype==4 and $vehiclecategory==1) $rent=150;
 else if ($vehicletype==5 and $vehiclecategory==0) $rent=150;
 else if ($vehicletype==5 and $vehiclecategory==1) $rent=150;
 else if ($vehicletype==6 and $vehiclecategory==0) $rent=150;
 else if ($vehicletype==6 and $vehiclecategory==1) $rent=150;
 
 $renttotal=$rent*$renttype*$rentqty;

 $insquery="insert into rental_info (ref_vehicle_id, ref_customer_id, start_date, return_date, order_date, rental_type, rental_qty, total_amount) values ('".$vehicleid."','".$customerid."','".$fromdate."','".$todate."',date(now()),'".$renttype."','".$rentqty."','".$renttotal."')";
$result = $conn->query($insquery);



if ($result)
echo "<script>alert('Rental booked Successfully')</script>";
else
echo "<script>alert('Please try again')</script>";
  
}
else
{
	echo "<script>alert('Please try with another vehicle.')</script>";

}


echo "<script>location.href='rentavehicle.php'</script>";
?>


