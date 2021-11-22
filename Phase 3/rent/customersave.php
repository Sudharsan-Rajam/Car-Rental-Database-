<?php

include "dbconn.php";

$customername=$_POST["customername"];
$customerphone=$_POST["customerphone"];

$insquery="insert into customer_info (customer_name, customer_phone) values ('".$customername."','".$customerphone."')";
$result = $conn->query($insquery);

if ($result)
echo "<script>alert('Customer Added Successfully')</script>";
else
echo "<script>alert('Please try again')</script>";

echo "<script>location.href='customeradd.php'</script>";
?>


