webtalk_init -webtalk_dir /home/user/utils/HLS_AxiMaster/using_hls_master_stream/project_1.sdk/webtalk
webtalk_register_client -client project
webtalk_add_data -client project -key date_generated -value "Wed May 27 14:13:09 2015" -context "software_version_and_target_device"
webtalk_add_data -client project -key product_version -value "SDK v2015.1" -context "software_version_and_target_device"
webtalk_add_data -client project -key build_version -value "2015.1" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_platform -value "amd64" -context "software_version_and_target_device"
webtalk_add_data -client project -key registration_id -value "730119_127455_210558914_643" -context "software_version_and_target_device"
webtalk_add_data -client project -key tool_flow -value "SDK" -context "software_version_and_target_device"
webtalk_add_data -client project -key beta -value "false" -context "software_version_and_target_device"
webtalk_add_data -client project -key route_design -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_family -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_device -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_package -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_speed -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key random_id -value "b90q8bu2vsceom1tf78sp0imtk" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_id -value "2015.1_2" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_iteration -value "2" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_name -value "Ubuntu" -context "user_environment"
webtalk_add_data -client project -key os_release -value "Ubuntu 14.04.2 LTS" -context "user_environment"
webtalk_add_data -client project -key cpu_name -value "Intel(R) Xeon(R) CPU           E5540  @ 2.53GHz" -context "user_environment"
webtalk_add_data -client project -key cpu_speed -value "2534.137 MHz" -context "user_environment"
webtalk_add_data -client project -key total_processors -value "1" -context "user_environment"
webtalk_add_data -client project -key system_ram -value "4.000 GB" -context "user_environment"
webtalk_register_client -client sdk
webtalk_add_data -client sdk -key uid -value "1432569116000" -context "sdk\\\\hardware/1432569116000"
webtalk_add_data -client sdk -key isZynq -value "true" -context "sdk\\\\hardware/1432569116000"
webtalk_add_data -client sdk -key Processors -value "2" -context "sdk\\\\hardware/1432569116000"
webtalk_add_data -client sdk -key VivadoVersion -value "2015.1" -context "sdk\\\\hardware/1432569116000"
webtalk_add_data -client sdk -key Arch -value "zynq" -context "sdk\\\\hardware/1432569116000"
webtalk_add_data -client sdk -key Device -value "7z010" -context "sdk\\\\hardware/1432569116000"
webtalk_add_data -client sdk -key IsHandoff -value "true" -context "sdk\\\\hardware/1432569116000"
webtalk_add_data -client sdk -key uid -value "1432569153000" -context "sdk\\\\bsp/1432569153000"
webtalk_add_data -client sdk -key hwid -value "1432569116000" -context "sdk\\\\bsp/1432569153000"
webtalk_add_data -client sdk -key os -value "standalone" -context "sdk\\\\bsp/1432569153000"
webtalk_add_data -client sdk -key apptemplate -value "zynq_fsbl" -context "sdk\\\\bsp/1432569153000"
webtalk_add_data -client sdk -key uid -value "1432569168000" -context "sdk\\\\application/1432569168000"
webtalk_add_data -client sdk -key hwid -value "1432569116000" -context "sdk\\\\application/1432569168000"
webtalk_add_data -client sdk -key bspid -value "1432569153000" -context "sdk\\\\application/1432569168000"
webtalk_add_data -client sdk -key newbsp -value "true" -context "sdk\\\\application/1432569168000"
webtalk_add_data -client sdk -key os -value "standalone" -context "sdk\\\\application/1432569168000"
webtalk_add_data -client sdk -key apptemplate -value "zynq_fsbl" -context "sdk\\\\application/1432569168000"
webtalk_transmit -clientid 2486378281 -regid "730119_127455_210558914_643" -xml /home/user/utils/HLS_AxiMaster/using_hls_master_stream/project_1.sdk/webtalk/usage_statistics_ext_sdk.xml -html /home/user/utils/HLS_AxiMaster/using_hls_master_stream/project_1.sdk/webtalk/usage_statistics_ext_sdk.html -wdm /home/user/utils/HLS_AxiMaster/using_hls_master_stream/project_1.sdk/webtalk/sdk_webtalk.wdm -intro "<H3>SDK Usage Report</H3><BR>"
webtalk_terminate
