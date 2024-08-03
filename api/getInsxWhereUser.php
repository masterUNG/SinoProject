<?php
header("content-type:text/javascript;charset=utf-8");
date_default_timezone_set("Asia/Bangkok");
error_reporting(0);
error_reporting(E_ERROR | E_PARSE);
$link = mysqli_connect('localhost', 'androidh_fluttertraining', 'Abc12345', "androidh_fluttertraining");

if (!$link) {
    echo "Error: Unable to connect to MySQL." . PHP_EOL;
    echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
    echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
    
    exit;
}

if (!$link->set_charset("utf8")) {
    printf("Error loading character set utf8: %s\n", $link->error);
    exit();
	}

if (isset($_GET)) {
	if ($_GET['isAdd'] == 'true') {
				
		$workername = $_GET['worker_name'];


		$result = mysqli_query($link, "SELECT * FROM `tb_work_import_data` WHERE `invoice_status` LIKE 'ดำเนินการเสร็จสมบูรณ์' AND  timestamp=curdate() AND `worker_name` LIKE '$workername' ORDER BY `tb_work_import_data`.`noti_date` ASC");

		if ($result) {

			while($row=mysqli_fetch_assoc($result)){
			$output[]=$row;

			}	// while

			echo json_encode($output);

		} //if

	} else echo "Welcome Sino";	

	// if2
   
   
}	// if1


	mysqli_close($link);
?>