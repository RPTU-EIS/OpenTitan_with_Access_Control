while IFS= read -r line
do
  echo "${line%%:*}"
  #sed -i 's/"prim_assert.sv"/"..\/..\/prim\/rtl\/prim_assert.sv"/g' ${line%%:*}
  #sed -i 's/"..\/..\/prim\/rtl\/prim_assert.sv"/"..\/..\/..\/ip\/prim\/rtl\/prim_assert.sv"/g' ${line%%:*}
  #sed -i 's/"..\/..\/prim\/rtl\/prim_assert.sv"/"..\/..\/..\/..\/ip\/prim\/rtl\/prim_assert.sv"/g' ${line%%:*}  
  #sed -i 's/"prim_assert.sv"/"..\/..\/lowrisc_prim_assert_0.1\/rtl\/prim_assert.sv"/g' ${line%%:*}
  sed -i 's/"dv_fcov_macros.svh"/"..\/..\/lowrisc_ip_usbdev_pkg_0.1\/lowrisc_dv_dv_fcov_macros_0\/dv_fcov_macros.svh"/g' ${line%%:*}
done < "./files_with_includes.txt"
#done <  "./files_with_includes_vendor.txt"
#done < "./files_with_includes_top_earlgrey_ip.txt"
#done < ./files_with_includes_build.txt