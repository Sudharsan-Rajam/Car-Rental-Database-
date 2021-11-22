<?php
include "menu.php";
?>
<form action="vehiclesave.php" method='post'>
<table style="margin:auto;width:500px;" cellpadding="5" cellspacing="10">
<tr><th colspan='2'>Add a Vehicle<br />&nbsp;</th></tr>
<tr><th align='left'>Vehicle ID</th><td><input type='text' name='vehicleid'></td></tr>
<tr><th align='left'>Description</th><td><input type='text' name='vehicledescription'></td></tr>
<tr><th align='left'>Year</th><td><input type='text' name='vehicleyear' maxlength="4" minlength="4" size="3"></td></tr>
<tr><th align='left'>Type</th><td><select name='vehicletype'><option>Select</option><option value='1'>Compact</option>
<option value='2'>Medium</option><option value='3'>Large</option><option value='4'>SUV</option><option value='5'>Truck</option><option value='6'>VAN</option></select></td></tr>
<tr><th align='left'>Cateogry</th><td><select name='vehiclecategory'><option>Select</option><option value='0'>Basic</option><option value='1'>Luxury</option></select></td></tr>

<tr><th colspan='2' align="center"><input type='Submit' Value='Save'></th></tr>
</form>
</table>
</tr>
</table>
