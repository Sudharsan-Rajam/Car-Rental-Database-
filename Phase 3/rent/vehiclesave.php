<?php

include "dbconn.php";

$vehicleid=$_POST["vehicleid"];
$vehicledescription=$_POST["vehicledescription"];
$vehicleyear=$_POST["vehicleyear"];
$vehicletype=$_POST["vehicletype"];
$vehiclecategory=$_POST["vehiclecategory"];

$insquery="insert into vehicle_info (vehicle_id, vehicle_description, vehicle_type, vehicle_category, vehicle_year) values ('".$vehicleid."','".$vehicledescription."','".$vehicletype."','".$vehiclecategory."','".$vehicleyear."')";
$result = $conn->query($insquery);

if ($result)
echo "<script>alert('Vehicle Added Successfully')</script>";
else
echo "<script>alert('Please try again')</script>";

echo "<script>location.href='vehicleadd.php'</script>";
?>


