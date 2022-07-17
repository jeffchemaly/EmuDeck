#!/bin/bash
#variables
RetroArch_emuName="RetroArch"
RetroArch_emuType="FlatPak"
RetroArch_emuPath="org.libretro.RetroArch"
RetroArch_releaseURL=""
RetroArch_configFile="$HOME/.var/app/org.libretro.RetroArch/config/retroarch/retroarch.cfg"
RetroArch_coreConfigFolders="$HOME/.var/app/org.libretro.RetroArch/config/retroarch/config"

#cleanupOlderThings
RetroArch_cleanup(){
	echo "NYI"
}

#Install
RetroArch_install(){

	installEmuFP "${RetroArch_emuName}" "${RetroArch_emuPath}"
	flatpak override "${RetroArch_emuPath}" --filesystem=host --user

}

#ApplyInitialSettings
RetroArch_init(){

	configEmuFP "${RetroArch_emuName}" "${RetroArch_emuPath}" "true"
	RetroArch_setEmulationFolder
	RetroArch_setupSaves
	RetroArch_installCores
	RetroArch_setUpCoreOptAll

}

#update
RetroArch_update(){

	configEmuFP "${RetroArch_emuName}" "${RetroArch_emuPath}"
	RetroArch_setEmulationFolder
	RetroArch_setupSaves
	RetroArch_installCores
	RetroArch_setUpCoreOptAll

}

#ConfigurePaths
RetroArch_setEmulationFolder(){

	system_directory='system_directory = '
	system_directorySetting="${system_directory}""\"${biosPath}\""
	changeLine "$system_directory" "$system_directorySetting" "$configFile"

}

#SetupSaves
RetroArch_setupSaves(){
	linkToSaveFolder retroarch states "$HOME/.var/app/org.libretro.RetroArch/config/retroarch/states"
	linkToSaveFolder retroarch saves "$HOME/.var/app/org.libretro.RetroArch/config/retroarch/saves"
}


#SetupStorage
RetroArch_setupStorage(){
	echo "NYI"
}


#WipeSettings
RetroArch_wipe(){
   rm -rf "$HOME/.var/app/$RetroArch_emuPath"
   # prob not cause roms are here
}


#Uninstall
RetroArch_uninstall(){
    flatpak uninstall "$RetroArch_emuPath" --user -y
}

#setABXYstyle
RetroArch_setABXYstyle(){
	echo "NYI"    
}

#Migrate
RetroArch_migrate(){
	echo "NYI"    
}

#WideScreenOn
RetroArch_wideScreenOn(){
echo "NYI"
}

#WideScreenOff
RetroArch_wideScreenOff(){
echo "NYI"
}

RetroArch_setOverride(){
	local fileName=$1
	local coreName=$2
	local option=$3
	local value=$4
	local settingLine="$option = $value"
	local fullPath="$RetroArch_coreConfigFolders/$coreName"
	local configFile="$fullPath/$fileName"

	updateOrAppendConfigLine "$configFile" "$option" "$settingLine" 
}

RetroArch_wswanc_bezelOn(){

	RetroArch_setOverride 'wswanc.cfg' 'Beetle Cygne'  'aspect_ratio_index' '"21"'
	RetroArch_setOverride 'wswanc.cfg' 'Beetle Cygne'  'input_overlay' '"~/.var/app/org.libretro.RetroArch/config/retroarch/overlays/pegasus/wswanc.cfg"'
	RetroArch_setOverride 'wswanc.cfg' 'Beetle Cygne'  'input_overlay_auto_scale' '"false"'
	RetroArch_setOverride 'wswanc.cfg' 'Beetle Cygne'  'input_overlay_enable' '"true"'
	RetroArch_setOverride 'wswanc.cfg' 'Beetle Cygne'  'input_overlay_opacity' '"0.700000"'
	RetroArch_setOverride 'wswanc.cfg' 'Beetle Cygne'  'input_overlay_scale_landscape' '"1.170000"'
	RetroArch_setOverride 'wswanc.cfg' 'Beetle Cygne'  'video_scale_integer' '"false"'
}
RetroArch_wswanc_bezelOff(){
	RetroArch_setOverride 'wswanc.cfg' 'Beetle Cygne'  'input_overlay_enable' '"false"'
}
RetroArch_wswanc_shaderOn(){
	RetroArch_setOverride 'wswanc.cfg' 'Beetle Cygne'  'video_shader_enable' 'true'
}

RetroArch_wswanc_shaderOff(){
	RetroArch_setOverride 'wswanc.cfg' 'Beetle Cygne'  'video_shader_enable' 'false'
}

RetroArch_wswan_bezelOn(){

	RetroArch_setOverride 'wswan.cfg' 'Beetle Cygne'  'aspect_ratio_index' '"21"'
	RetroArch_setOverride 'wswan.cfg' 'Beetle Cygne'  'input_overlay' '"~/.var/app/org.libretro.RetroArch/config/retroarch/overlays/pegasus/wswan.cfg"'
	RetroArch_setOverride 'wswan.cfg' 'Beetle Cygne'  'input_overlay_auto_scale' '"false"'
	RetroArch_setOverride 'wswan.cfg' 'Beetle Cygne'  'input_overlay_enable' '"true"'
	RetroArch_setOverride 'wswan.cfg' 'Beetle Cygne'  'input_overlay_opacity' '"0.700000"'
	RetroArch_setOverride 'wswan.cfg' 'Beetle Cygne'  'input_overlay_scale_landscape' '"1.170000"'
	RetroArch_setOverride 'wswan.cfg' 'Beetle Cygne'  'video_scale_integer' '"false"'
}

RetroArch_wswan_bezelOff(){
	RetroArch_setOverride 'wswan.cfg' 'Beetle Cygne'  'input_overlay_enable' '"false"'
}

RetroArch_wswan_shaderOn(){
	RetroArch_setOverride 'wswan.cfg' 'Beetle Cygne'  'video_shader_enable' 'true'
}

RetroArch_wswanc_shaderOff(){
	RetroArch_setOverride 'wswan.cfg' 'Beetle Cygne'  'video_shader_enable' 'false'
}

RetroArch_dolphin_emu_setConfig(){
	RetroArch_setOverride 'dolphin_emu.cfg' 'dolphin_emu'  'video_driver' '"gl"'
}

RetroArch_PPSSPP_setConfig(){
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_auto_frameskip' '"disabled"'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_block_transfer_gpu' '"enabled"'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_button_preference' '"Cross"'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_cheats' '"disabled"'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_cpu_core' '"JIT"'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_disable_slow_framebuffer_effects' '"disabled"'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_fast_memory' '"enabled"'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_force_lag_sync' '"disabled"'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_frameskip' '"Off"'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_frameskiptype' '"Number'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_gpu_hardware_transform' '"enabled"'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_ignore_bad_memory_access' '"enabled"'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_inflight_frames' '"Up'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_internal_resolution' '"1440x816"'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_io_timing_method' '"Fast"'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_language' '"Automatic"'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_lazy_texture_caching' '"disabled"'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_locked_cpu_speed' '"off"'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_lower_resolution_for_effects' '"Off"'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_rendering_mode' '"Buffered"'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_retain_changed_textures' '"disabled"'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_software_skinning' '"enabled"'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_spline_quality' '"Low"'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_texture_anisotropic_filtering' '"off"'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_texture_deposterize' '"disabled"'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_texture_filtering' '"Auto"'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_texture_replacement' '"enabled"'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_texture_scaling_level' '"Off"'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_texture_scaling_type' '"xbrz"'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_texture_shader' '"Off"'
	RetroArch_setOverride 'psp.cfg' 'PPSSPP'  'ppsspp_vertex_cache' '"disabled"'
}

RetroArch_pcengine_bezelOn(){
	RetroArch_setOverride 'pcengine.cfg' 'Beetle PCE Fast'  'aspect_ratio_index' '"21"'
	RetroArch_setOverride 'pcengine.cfg' 'Beetle PCE Fast'  'custom_viewport_height' '"1200"'
	RetroArch_setOverride 'pcengine.cfg' 'Beetle PCE Fast'  'custom_viewport_x' '"0"'
	RetroArch_setOverride 'pcengine.cfg' 'Beetle PCE Fast'  'input_overlay' '"~/.var/app/org.libretro.RetroArch/config/retroarch/overlays/pegasus/pcengine.cfg"'
	RetroArch_setOverride 'pcengine.cfg' 'Beetle PCE Fast'  'input_overlay_auto_scale' '"false"'
	RetroArch_setOverride 'pcengine.cfg' 'Beetle PCE Fast'  'input_overlay_enable' '"true"'
	RetroArch_setOverride 'pcengine.cfg' 'Beetle PCE Fast'  'input_overlay_hide_in_menu' '"false"'
	RetroArch_setOverride 'pcengine.cfg' 'Beetle PCE Fast'  'input_overlay_scale_landscape' '"1.025000"'
}

RetroArch_pcengine_bezelOff(){
	RetroArch_setOverride 'pcengine.cfg' 'Beetle PCE Fast'  'input_overlay_enable' '"false"'
}

RetroArch_nes_bezelOn(){
	RetroArch_setOverride 'nes.cfg' 'Mesen'  'input_overlay' '"~/.var/app/org.libretro.RetroArch/config/retroarch/overlays/pegasus/nes.cfg"'
	RetroArch_setOverride 'nes.cfg' 'Mesen'  'input_overlay_auto_scale' '"false"'
	RetroArch_setOverride 'nes.cfg' 'Mesen'  'input_overlay_enable' '"true"'
	RetroArch_setOverride 'nes.cfg' 'Mesen'  'input_overlay_opacity' '"0.700000"'
	RetroArch_setOverride 'nes.cfg' 'Mesen'  'input_overlay_scale_landscape' '"1.070000"'
	RetroArch_setOverride 'nes.cfg' 'Mesen'  'video_scale_integer' '"false"'

	RetroArch_setOverride 'nes.cfg' 'Nestopia'  'input_overlay' '"~/.var/app/org.libretro.RetroArch/config/retroarch/overlays/pegasus/nes.cfg"'
	RetroArch_setOverride 'nes.cfg' 'Nestopia'  'input_overlay_auto_scale' '"false"'
	RetroArch_setOverride 'nes.cfg' 'Nestopia'  'input_overlay_enable' '"true"'
	RetroArch_setOverride 'nes.cfg' 'Nestopia'  'input_overlay_opacity' '"0.700000"'
	RetroArch_setOverride 'nes.cfg' 'Nestopia'  'input_overlay_scale_landscape' '"1.070000"'
	RetroArch_setOverride 'nes.cfg' 'Nestopia'  'video_scale_integer' '"false"'
}

RetroArch_nes_bezelOff(){
	RetroArch_setOverride 'nes.cfg' 'Nestopia'  'input_overlay_enable' '"false"'

	RetroArch_setOverride 'nes.cfg' 'Mesen'  'input_overlay_enable' '"false"'
}

RetroArch_Mupen64Plus_Next_setConfig(){
	RetroArch_setOverride 'n64.cfg' 'Mupen64Plus-Next'  'aspect_ratio_index' '"0"'
	RetroArch_setOverride 'n64.cfg' 'Mupen64Plus-Next'  'video_crop_overscan' '"false"'
	RetroArch_setOverride 'n64.cfg' 'Mupen64Plus-Next'  'video_smooth' '"true"'
}

RetroArch_n64_shaderOn(){
	RetroArch_setOverride 'n64.cfg' 'Mupen64Plus-Next'  'video_shader_enable' '"true"'
}

RetroArch_n64_shaderOff(){
	RetroArch_setOverride 'n64.cfg' 'Mupen64Plus-Next'  'video_shader_enable' '"false"'
}

RetroArch_lynx_bezelOn(){
	RetroArch_setOverride 'lynx.cfg' 'Beetle Lynx'  'aspect_ratio_index' '"21"'
	RetroArch_setOverride 'lynx.cfg' 'Beetle Lynx'  'input_overlay' '"~/.var/app/org.libretro.RetroArch/config/retroarch/overlays/pegasus/lynx.cfg"'
	RetroArch_setOverride 'lynx.cfg' 'Beetle Lynx'  'input_overlay_auto_scale' '"false"'
	RetroArch_setOverride 'lynx.cfg' 'Beetle Lynx'  'input_overlay_enable' '"true"'
	RetroArch_setOverride 'lynx.cfg' 'Beetle Lynx'  'input_overlay_opacity' '"0.700000"'
	RetroArch_setOverride 'lynx.cfg' 'Beetle Lynx'  'input_overlay_scale_landscape' '"1.170000"'
	RetroArch_setOverride 'lynx.cfg' 'Beetle Lynx'  'video_scale_integer' '"false"'
}
RetroArch_lynx_bezelOff(){
	RetroArch_setOverride 'lynx.cfg' 'Beetle Lynx'  'input_overlay_enable' '"false"'
}
RetroArch_lynx_shaderOn(){
	RetroArch_setOverride 'lynx.cfg' 'Beetle Lynx'  'video_shader_enable' 'true'
}

RetroArch_lynx_shaderOff(){
	RetroArch_setOverride 'lynx.cfg' 'Beetle Lynx'  'video_shader_enable' 'false'
}

RetroArch_SameBoy_gb_setConfig(){
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'gambatte_dark_filter_level' '"0"'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'gambatte_gb_bootloader' '"enabled"'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'gambatte_gb_colorization' '"internal"'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'gambatte_gb_hwmode' '"Auto"'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'gambatte_gb_internal_palette' '"GB'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'gambatte_gb_link_mode' '"Not'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'gambatte_gb_link_network_port' '"56400"'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'gambatte_gb_link_network_server_ip_1' '"0"'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'gambatte_gb_link_network_server_ip_10' '"0"'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'gambatte_gb_link_network_server_ip_11' '"0"'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'gambatte_gb_link_network_server_ip_12' '"0"'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'gambatte_gb_link_network_server_ip_2' '"0"'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'gambatte_gb_link_network_server_ip_3' '"0"'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'gambatte_gb_link_network_server_ip_4' '"0"'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'gambatte_gb_link_network_server_ip_5' '"0"'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'gambatte_gb_link_network_server_ip_6' '"0"'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'gambatte_gb_link_network_server_ip_7' '"0"'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'gambatte_gb_link_network_server_ip_8' '"0"'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'gambatte_gb_link_network_server_ip_9' '"0"'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'gambatte_gb_palette_twb64_1' '"TWB64'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'gambatte_gb_palette_twb64_2' '"TWB64'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'gambatte_mix_frames' '"disabled"'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'gambatte_rumble_level' '"10"'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'gambatte_show_gb_link_settings' '"disabled"'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'gambatte_turbo_period' '"4"'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'gambatte_up_down_allowed' '"disabled"'
}

RetroArch_ngp_bezelOn(){
	RetroArch_setOverride 'ngp.cfg' 'Beetle NeoPop'  'aspect_ratio_index' '"21"'
	RetroArch_setOverride 'ngp.cfg' 'Beetle NeoPop'  'input_overlay' '"~/.var/app/org.libretro.RetroArch/config/retroarch/overlays/pegasus/ngpc.cfg"'
	RetroArch_setOverride 'ngp.cfg' 'Beetle NeoPop'  'input_overlay_aspect_adjust_landscape' '"-0.310000"'
	RetroArch_setOverride 'ngp.cfg' 'Beetle NeoPop'  'input_overlay_auto_scale' '"false"'
	RetroArch_setOverride 'ngp.cfg' 'Beetle NeoPop'  'input_overlay_enable' '"true"'
	RetroArch_setOverride 'ngp.cfg' 'Beetle NeoPop'  'input_overlay_hide_in_menu' '"false"'
	RetroArch_setOverride 'ngp.cfg' 'Beetle NeoPop'  'input_overlay_scale_landscape' '"1.625000"'
	RetroArch_setOverride 'ngp.cfg' 'Beetle NeoPop'  'input_overlay_x_separation_portrait' '"-0.010000"'
	RetroArch_setOverride 'ngp.cfg' 'Beetle NeoPop'  'input_overlay_y_offset_landscape' '"-0.135000"'
}

RetroArch_ngp_bezelOff(){
	RetroArch_setOverride 'ngp.cfg' 'Beetle NeoPop'  'input_overlay_enable' '"false"'
}

RetroArch_ngp_shaderOn(){
	RetroArch_setOverride 'ngp.cfg' 'Beetle NeoPop'  'video_shader_enable' 'true'
}

RetroArch_ngp_shaderOff(){
	RetroArch_setOverride 'ngp.cfg' 'Beetle NeoPop'  'video_shader_enable' 'false'
}

RetroArch_ngpc_bezelOn(){
	RetroArch_setOverride 'ngpc.cfg' 'Beetle NeoPop'  'aspect_ratio_index' '"21"'
	RetroArch_setOverride 'ngpc.cfg' 'Beetle NeoPop'  'input_overlay' '"~/.var/app/org.libretro.RetroArch/config/retroarch/overlays/pegasus/ngpc.cfg"'
	RetroArch_setOverride 'ngpc.cfg' 'Beetle NeoPop'  'input_overlay_aspect_adjust_landscape' '"-0.170000"'
	RetroArch_setOverride 'ngpc.cfg' 'Beetle NeoPop'  'input_overlay_auto_scale' '"false"'
	RetroArch_setOverride 'ngpc.cfg' 'Beetle NeoPop'  'input_overlay_enable' '"true"'
	RetroArch_setOverride 'ngpc.cfg' 'Beetle NeoPop'  'input_overlay_scale_landscape' '"1.615000"'
	RetroArch_setOverride 'ngpc.cfg' 'Beetle NeoPop'  'input_overlay_x_separation_portrait' '"-0.010000"'
	RetroArch_setOverride 'ngpc.cfg' 'Beetle NeoPop'  'input_overlay_y_offset_landscape' '"-0.135000"'
}

RetroArch_ngp_bezelOff(){
	RetroArch_setOverride 'ngpc.cfg' 'Beetle NeoPop'  'input_overlay_enable' '"false"'
}

RetroArch_ngpc_shaderOn(){
	RetroArch_setOverride 'ngp.cfg' 'Beetle NeoPop'  'video_shader_enable' 'true'
}

RetroArch_ngpc_shaderOff(){
	RetroArch_setOverride 'ngp.cfg' 'Beetle NeoPop'  'video_shader_enable' 'false'
}

RetroArch_atari2600_bezelOn(){
	RetroArch_setOverride 'atari2600.cfg' 'Stella'  'input_overlay' '"~/.var/app/org.libretro.RetroArch/config/retroarch/overlays/pegasus/atari2600.cfg"'
	RetroArch_setOverride 'atari2600.cfg' 'Stella'  'input_overlay_enable' '"true"'
	RetroArch_setOverride 'atari2600.cfg' 'Stella'  'input_overlay_scale_landscape' '"1.0"'
}

RetroArch_atari2600_bezelOff(){
	RetroArch_setOverride 'atari2600.cfg' 'Stella'  'input_overlay_enable' '"false"'
}

RetroArch_mame_bezelOn(){

	RetroArch_setOverride 'mame.cfg' 'MAME 2003-Plus'  'aspect_ratio_index' '"21"'
	RetroArch_setOverride 'mame.cfg' 'MAME 2003-Plus'  'input_overlay' '"~/.var/app/org.libretro.RetroArch/config/retroarch/overlays/pegasus/MAME_Horizontal.cfg"'
	RetroArch_setOverride 'mame.cfg' 'MAME 2003-Plus'  'input_overlay_auto_scale' '"false"'
	RetroArch_setOverride 'mame.cfg' 'MAME 2003-Plus'  'input_overlay_enable' '"true"'
	RetroArch_setOverride 'mame.cfg' 'MAME 2003-Plus'  'input_overlay_opacity' '"0.700000"'
	RetroArch_setOverride 'mame.cfg' 'MAME 2003-Plus'  'input_overlay_scale_landscape' '"1.170000"'
	RetroArch_setOverride 'mame.cfg' 'MAME 2003-Plus'  'video_scale_integer' '"false"'
}

RetroArch_mame_bezelOff(){
	RetroArch_setOverride 'mame.cfg' 'MAME 2003-Plus'  'input_overlay_enable' '"false"'
}

RetroArch_mame_shaderOn(){
	RetroArch_setOverride 'mame.cfg' 'MAME 2003-Plus'  'video_shader_enable' 'true'
}

RetroArch_mame_shaderOff(){
	RetroArch_setOverride 'mame.cfg' 'MAME 2003-Plus'  'video_shader_enable' 'false'
}

RetroArch_segacd_bezelOn(){
	RetroArch_setOverride 'megacd.cfg' 'Genesis Plus GX'  'input_overlay' '"~/.var/app/org.libretro.RetroArch/config/retroarch/overlays/pegasus/SEGACD.cfg"'
	RetroArch_setOverride 'megacd.cfg' 'Genesis Plus GX'  'input_overlay_auto_scale' '"false"'
	RetroArch_setOverride 'megacd.cfg' 'Genesis Plus GX'  'input_overlay_enable' '"true"'
	RetroArch_setOverride 'megacd.cfg' 'Genesis Plus GX'  'input_overlay_hide_in_menu' '"false"'
	RetroArch_setOverride 'megacd.cfg' 'Genesis Plus GX'  'input_overlay_scale_landscape' '"1.170000'

	RetroArch_setOverride 'segacd.cfg' 'Genesis Plus GX'  'input_overlay' '"~/.var/app/org.libretro.RetroArch/config/retroarch/overlays/pegasus/SEGACD.cfg"'
	RetroArch_setOverride 'segacd.cfg' 'Genesis Plus GX'  'input_overlay_auto_scale' '"false"'
	RetroArch_setOverride 'segacd.cfg' 'Genesis Plus GX'  'input_overlay_enable' '"true"'
	RetroArch_setOverride 'segacd.cfg' 'Genesis Plus GX'  'input_overlay_hide_in_menu' '"false"'
	RetroArch_setOverride 'segacd.cfg' 'Genesis Plus GX'  'input_overlay_scale_landscape' '"1.170000'
}
RetroArch_segacd_bezelOff(){
	RetroArch_setOverride 'megacd.cfg' 'Genesis Plus GX'  'input_overlay_enable' '"false"'

	RetroArch_setOverride 'segacd.cfg' 'Genesis Plus GX'  'input_overlay_enable' '"false"'
}

RetroArch_genesis_bezelOn(){
	RetroArch_setOverride 'genesis.cfg' 'Genesis Plus GX'  'input_overlay' '"~/.var/app/org.libretro.RetroArch/config/retroarch/overlays/pegasus/genesis.cfg"'
	RetroArch_setOverride 'genesis.cfg' 'Genesis Plus GX'  'input_overlay_auto_scale' '"false"'
	RetroArch_setOverride 'genesis.cfg' 'Genesis Plus GX'  'input_overlay_enable' '"true"'
	RetroArch_setOverride 'genesis.cfg' 'Genesis Plus GX'  'input_overlay_scale_landscape' '"1.170000"'

	RetroArch_setOverride 'megadrive.cfg' 'Genesis Plus GX'  'input_overlay' '"~/.var/app/org.libretro.RetroArch/config/retroarch/overlays/pegasus/genesis.cfg"'
	RetroArch_setOverride 'megadrive.cfg' 'Genesis Plus GX'  'input_overlay_auto_scale' '"false"'
	RetroArch_setOverride 'megadrive.cfg' 'Genesis Plus GX'  'input_overlay_enable' '"true"'
	RetroArch_setOverride 'megadrive.cfg' 'Genesis Plus GX'  'input_overlay_scale_landscape' '"1.170000"'

}

RetroArch_segacd_bezelOff(){
	RetroArch_setOverride 'megadrive.cfg' 'Genesis Plus GX'  'input_overlay_enable' '"false"'

	RetroArch_setOverride 'genesis.cfg' 'Genesis Plus GX'  'input_overlay_enable' '"false"'
}

RetroArch_genesis_shaderOn(){
	RetroArch_setOverride 'genesis.cfg' 'Genesis Plus GX'  'video_shader_enable' '"true"'
	RetroArch_setOverride 'megadrive.cfg' 'Genesis Plus GX'  'video_shader_enable' '"true"'
}

RetroArch_genesis_shaderOff(){
	RetroArch_setOverride 'genesis.cfg' 'Genesis Plus GX'  'video_shader_enable' '"false"'
	RetroArch_setOverride 'megadrive.cfg' 'Genesis Plus GX'  'video_shader_enable' '"false"'
}


RetroArch_gamegear_bezelOn(){
	RetroArch_setOverride 'gamegear.cfg' 'Genesis Plus GX'  'aspect_ratio_index' '"21"'
	RetroArch_setOverride 'gamegear.cfg' 'Genesis Plus GX'  'input_overlay' '"~/.var/app/org.libretro.RetroArch/config/retroarch/overlays/pegasus/gg.cfg"'
	RetroArch_setOverride 'gamegear.cfg' 'Genesis Plus GX'  'input_overlay_aspect_adjust_landscape' '"-0.115000"'
	RetroArch_setOverride 'gamegear.cfg' 'Genesis Plus GX'  'input_overlay_auto_scale' '"false"'
	RetroArch_setOverride 'gamegear.cfg' 'Genesis Plus GX'  'input_overlay_enable' '"true"'
	RetroArch_setOverride 'gamegear.cfg' 'Genesis Plus GX'  'input_overlay_scale_landscape' '"1.545000"'

	RetroArch_setOverride 'gamegear.cfg' 'Gearsystem'  'aspect_ratio_index' '"21"'
	RetroArch_setOverride 'gamegear.cfg' 'Gearsystem'  'input_overlay' '"~/.var/app/org.libretro.RetroArch/config/retroarch/overlays/pegasus/gg.cfg"'
	RetroArch_setOverride 'gamegear.cfg' 'Gearsystem'  'input_overlay_aspect_adjust_landscape' '"-0.115000"'
	RetroArch_setOverride 'gamegear.cfg' 'Gearsystem'  'input_overlay_auto_scale' '"false"'
	RetroArch_setOverride 'gamegear.cfg' 'Gearsystem'  'input_overlay_enable' '"true"'
	RetroArch_setOverride 'gamegear.cfg' 'Gearsystem'  'input_overlay_scale_landscape' '"1.545000"'
}

RetroArch_segacd_bezelOff(){
	RetroArch_setOverride 'gamegear.cfg' 'Genesis Plus GX'  'input_overlay_enable' '"false"'

	RetroArch_setOverride 'gamegear.cfg' 'Gearsystem'  'input_overlay_enable' '"false"'
}

RetroArch_gamegear_shaderOn(){
	RetroArch_setOverride 'gamegear.cfg' 'Genesis Plus GX'  'video_shader_enable' '"true"'
	RetroArch_setOverride 'gamegear.cfg' 'Gearsystem'  'video_shader_enable' '"true"'
}

RetroArch_gamegear_shaderOff(){
	RetroArch_setOverride 'gamegear.cfg' 'Genesis Plus GX'  'video_shader_enable' '"true"'
	RetroArch_setOverride 'gamegear.cfg' 'Gearsystem'  'video_shader_enable' '"true"'
}

RetroArch_mastersystem_bezelOn(){
	RetroArch_setOverride 'mastersystem.cfg' 'Genesis Plus GX'  'aspect_ratio_index' '"21"'
	RetroArch_setOverride 'mastersystem.cfg' 'Genesis Plus GX'  'input_overlay' '"~/.var/app/org.libretro.RetroArch/config/retroarch/overlays/pegasus/mastersystem.cfg"'
	RetroArch_setOverride 'mastersystem.cfg' 'Genesis Plus GX'  'input_overlay_auto_scale' '"false"'
	RetroArch_setOverride 'mastersystem.cfg' 'Genesis Plus GX'  'input_overlay_enable' '"true"'
	RetroArch_setOverride 'mastersystem.cfg' 'Genesis Plus GX'  'input_overlay_scale_landscape' '"1.170000"'
}

RetroArch_mastersystem_bezelOff(){
	RetroArch_setOverride 'mastersystem.cfg' 'Genesis Plus GX'  'input_overlay_enable' '"false"'
}

RetroArch_sega32x_bezelOn(){
	RetroArch_setOverride 'sega32x.cfg' 'PicoDrive'  'input_overlay' '"~/.var/app/org.libretro.RetroArch/config/retroarch/overlays/pegasus/sega32x.cfg"'
	RetroArch_setOverride 'sega32x.cfg' 'PicoDrive'  'input_overlay_auto_scale' '"false"'
	RetroArch_setOverride 'sega32x.cfg' 'PicoDrive'  'input_overlay_enable' '"true"'
	RetroArch_setOverride 'sega32x.cfg' 'PicoDrive'  'input_overlay_hide_in_menu' '"false"'
	RetroArch_setOverride 'sega32x.cfg' 'PicoDrive'  'input_overlay_scale_landscape' '"1.250000"'
}

RetroArch_sega32x_bezelOff(){
	RetroArch_setOverride 'sega32x.cfg' 'PicoDrive'  'input_overlay_enable' '"false"'
}

RetroArch_gba_bezelOn(){
	#missing stuff?
	RetroArch_setOverride 'gba.cfg' 'mGBA'  'aspect_ratio_index' '"21"'
}

RetroArch_gba_shaderOn(){
	RetroArch_setOverride 'gba.cfg' 'mGBA'  'video_shader_enable' '"true"'
}

RetroArch_gba_shaderOff(){
	RetroArch_setOverride 'gba.cfg' 'mGBA'  'video_shader_enable' '"false"'
}

RetroArch_gb_bezelOn(){
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'aspect_ratio_index' '"21"'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'input_overlay' '"~/.var/app/org.libretro.RetroArch/config/retroarch/overlays/pegasus/gb.cfg"'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'input_overlay_auto_scale' '"false"'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'input_overlay_enable' '"true"'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'input_overlay_scale_landscape' '"1.860000"'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'input_overlay_y_offset_landscape' '"-0.150000"'

	RetroArch_setOverride 'gb.cfg' 'Gambatte'  'aspect_ratio_index' '"21"'
	RetroArch_setOverride 'gb.cfg' 'Gambatte'  'input_overlay' '"~/.var/app/org.libretro.RetroArch/config/retroarch/overlays/pegasus/gb.cfg"'
	RetroArch_setOverride 'gb.cfg' 'Gambatte'  'input_overlay_auto_scale' '"false"'
	RetroArch_setOverride 'gb.cfg' 'Gambatte'  'input_overlay_enable' '"true"'
	RetroArch_setOverride 'gb.cfg' 'Gambatte'  'input_overlay_scale_landscape' '"1.860000"'
	RetroArch_setOverride 'gb.cfg' 'Gambatte'  'input_overlay_y_offset_landscape' '"-0.150000"'
}

RetroArch_gb_bezelOff(){
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'input_overlay_enable' '"false"'


	RetroArch_setOverride 'gb.cfg' 'Gambatte'  'input_overlay_enable' '"false"'
}

RetroArch_gb_shaderOn(){
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'video_shader_enable' 'true'

	RetroArch_setOverride 'gb.cfg' 'Gambatte'  'video_shader_enable' '"true"'
}

RetroArch_gb_shaderOff(){
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'video_shader_enable' 'false'

	RetroArch_setOverride 'gb.cfg' 'Gambatte'  'video_shader_enable' '"false"'
}

RetroArch_SameBoy_gbc_setConfig(){
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'gambatte_gbc_color_correction' '"GBC'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'gambatte_gbc_color_correction_mode' '"accurate"'
	RetroArch_setOverride 'gb.cfg' 'SameBoy'  'gambatte_gbc_frontlight_position' '"central"'
}


RetroArch_gbc_bezelOn(){
	RetroArch_setOverride 'gbc.cfg' 'SameBoy'  'aspect_ratio_index' '"21"'
	RetroArch_setOverride 'gbc.cfg' 'SameBoy'  'input_overlay' '"~/.var/app/org.libretro.RetroArch/config/retroarch/overlays/pegasus/gbc.cfg"'
	RetroArch_setOverride 'gbc.cfg' 'SameBoy'  'input_overlay_auto_scale' '"false"'
	RetroArch_setOverride 'gbc.cfg' 'SameBoy'  'input_overlay_enable' '"true"'
	RetroArch_setOverride 'gbc.cfg' 'SameBoy'  'input_overlay_scale_landscape' '"1.870000"'
	RetroArch_setOverride 'gbc.cfg' 'SameBoy'  'input_overlay_y_offset_landscape' '"-0.220000"'

	RetroArch_setOverride 'gbc.cfg' 'Gambatte'  'aspect_ratio_index' '"21"'
	RetroArch_setOverride 'gbc.cfg' 'Gambatte'  'input_overlay' '"~/.var/app/org.libretro.RetroArch/config/retroarch/overlays/pegasus/gbc.cfg"'
	RetroArch_setOverride 'gbc.cfg' 'Gambatte'  'input_overlay_auto_scale' '"false"'
	RetroArch_setOverride 'gbc.cfg' 'Gambatte'  'input_overlay_enable' '"true"'
	RetroArch_setOverride 'gbc.cfg' 'Gambatte'  'input_overlay_scale_landscape' '"1.870000"'
	RetroArch_setOverride 'gbc.cfg' 'Gambatte'  'input_overlay_y_offset_landscape' '"-0.220000"'
}
RetroArch_gbc_bezelOff(){
	RetroArch_setOverride 'gbc.cfg' 'SameBoy'  'input_overlay_enable' '"false"'


	RetroArch_setOverride 'gbc.cfg' 'Gambatte'  'input_overlay_enable' '"false"'
}

RetroArch_gbc_shaderOn(){
	RetroArch_setOverride 'gbc.cfg' 'SameBoy'  'video_shader_enable' 'true'

	RetroArch_setOverride 'gbc.cfg' 'Gambatte'  'video_shader_enable' 'true'
}

RetroArch_gbc_shaderOff(){
	RetroArch_setOverride 'gbc.cfg' 'SameBoy'  'video_shader_enable' 'false'

	RetroArch_setOverride 'gbc.cfg' 'Gambatte'  'video_shader_enable' 'false'
}




RetroArch_snes_bezelOn(){
	RetroArch_setOverride 'snes.cfg' 'Snes9x'  'input_overlay' '"~/.var/app/org.libretro.RetroArch/config/retroarch/overlays/pegasus/snes.cfg"'
	RetroArch_setOverride 'snes.cfg' 'Snes9x'  'input_overlay_auto_scale' '"false"'
	RetroArch_setOverride 'snes.cfg' 'Snes9x'  'input_overlay_enable' '"true"'
	RetroArch_setOverride 'snes.cfg' 'Snes9x'  'input_overlay_opacity' '"0.700000"'
	RetroArch_setOverride 'snes.cfg' 'Snes9x'  'video_scale_integer' '"false"'
}
RetroArch_snes_bezelOff(){
	RetroArch_setOverride 'snes.cfg' 'Snes9x'  'input_overlay_enable' '"false"'
}
RetroArch_snes_ar43(){
	RetroArch_setOverride 'snes.cfg' 'Snes9x'  'input_overlay_scale_landscape' '"1.170000"'
	RetroArch_setOverride 'snes.cfg' 'Snes9x'  'input_overlay_aspect_adjust_landscape' '"0"'
	RetroArch_setOverride 'snes.cfg' 'Snes9x'  'input_overlay' '"~/.var/app/org.libretro.RetroArch/config/retroarch/overlays/pegasus/snes.cfg"'
}

RetroArch_snes_ar87(){
	RetroArch_setOverride 'snes.cfg' 'Snes9x'  'input_overlay' '"~/.var/app/org.libretro.RetroArch/config/retroarch/overlays/pegasus/snes87.cfg"'
	RetroArch_setOverride 'snes.cfg' 'Snes9x'  'input_overlay_scale_landscape' '"1.380000"'
	RetroArch_setOverride 'snes.cfg' 'Snes9x'  'input_overlay_aspect_adjust_landscape' '"-0.170000"'
	RetroArch_setOverride 'snes.cfg' 'Snes9x'  'aspect_ratio_index' '"21"'
}


RetroArch_bsnes_hd_beta_bezelOn(){
	RetroArch_setOverride 'sneshd.cfg' 'bsnes-hd beta'  'video_scale_integer' '"false"'
}

RetroArch_melonDS_setUpCoreOpt(){
	RetroArch_setOverride 'nds.opt' 'melonDS'  'melonds_audio_bitrate' '"Automatic"'
	RetroArch_setOverride 'nds.opt' 'melonDS'  'melonds_audio_interpolation' '"None"'
	RetroArch_setOverride 'nds.opt' 'melonDS'  'melonds_boot_directly' '"enabled"'
	RetroArch_setOverride 'nds.opt' 'melonDS'  'melonds_console_mode' '"DS"'
	RetroArch_setOverride 'nds.opt' 'melonDS'  'melonds_dsi_sdcard' '"disabled"'
	RetroArch_setOverride 'nds.opt' 'melonDS'  'melonds_hybrid_ratio' '"3"'
	RetroArch_setOverride 'nds.opt' 'melonDS'  'melonds_hybrid_small_screen' '"Bottom"'
	RetroArch_setOverride 'nds.opt' 'melonDS'  'melonds_jit_block_size' '"32"'
	RetroArch_setOverride 'nds.opt' 'melonDS'  'melonds_jit_branch_optimisations' '"enabled"'
	RetroArch_setOverride 'nds.opt' 'melonDS'  'melonds_jit_enable' '"enabled"'
	RetroArch_setOverride 'nds.opt' 'melonDS'  'melonds_jit_fast_memory' '"enabled"'
	RetroArch_setOverride 'nds.opt' 'melonDS'  'melonds_jit_literal_optimisations' '"enabled"'
	RetroArch_setOverride 'nds.opt' 'melonDS'  'melonds_opengl_better_polygons' '"enabled"'
	RetroArch_setOverride 'nds.opt' 'melonDS'  'melonds_opengl_filtering' '"nearest"'
	RetroArch_setOverride 'nds.opt' 'melonDS'  'melonds_opengl_renderer' '"enabled"'
	RetroArch_setOverride 'nds.opt' 'melonDS'  'melonds_opengl_resolution' '"5x'
	RetroArch_setOverride 'nds.opt' 'melonDS'  'melonds_randomize_mac_address' '"disabled"'
	RetroArch_setOverride 'nds.opt' 'melonDS'  'melonds_screen_gap' '"0"'
	RetroArch_setOverride 'nds.opt' 'melonDS'  'melonds_screen_layout' '"Hybrid'
	RetroArch_setOverride 'nds.opt' 'melonDS'  'melonds_swapscreen_mode' '"Toggle"'
	RetroArch_setOverride 'nds.opt' 'melonDS'  'melonds_threaded_renderer' '"disabled"'
	RetroArch_setOverride 'nds.opt' 'melonDS'  'melonds_touch_mode' '"Touch"'
}

RetroArch_Mupen64Plus_Next_setUpCoreOpt(){
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-169screensize' '"1920x1080"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-43screensize' '"1280x960"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-alt-map' '"False"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-angrylion-multithread' '"all'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-angrylion-overscan' '"disabled"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-angrylion-sync' '"Low"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-angrylion-vioverlay' '"Filtered"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-aspect' '"4:3"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-astick-deadzone' '"15"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-astick-sensitivity' '"100"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-BackgroundMode' '"OnePiece"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-BilinearMode' '"standard"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-CorrectTexrectCoords' '"Auto"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-CountPerOp' '"0"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-CountPerOpDenomPot' '"0"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-cpucore' '"dynamic_recompiler"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-d-cbutton' '"C3"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-DitheringPattern' '"False"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-DitheringQuantization' '"False"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-EnableCopyAuxToRDRAM' '"False"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-EnableCopyColorToRDRAM' '"Async"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-EnableCopyDepthToRDRAM' '"Software"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-EnableEnhancedHighResStorage' '"False"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-EnableEnhancedTextureStorage' '"False"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-EnableFBEmulation' '"True"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-EnableFragmentDepthWrite' '"True"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-EnableHiResAltCRC' '"False"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-EnableHWLighting' '"False"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-EnableInaccurateTextureCoordinates' '"False"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-EnableLegacyBlending' '"False"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-EnableLODEmulation' '"True"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-EnableN64DepthCompare' '"False"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-EnableNativeResFactor' '"4"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-EnableNativeResTexrects' '"Optimized"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-EnableOverscan' '"Enabled"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-EnableShadersStorage' '"True"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-EnableTexCoordBounds' '"True"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-EnableTextureCache' '"True"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-ForceDisableExtraMem' '"False"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-FrameDuping' '"False"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-Framerate' '"Fullspeed"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-FXAA' '"0"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-GLideN64IniBehaviour' '"late"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-HybridFilter' '"False"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-IgnoreTLBExceptions' '"False"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-l-cbutton' '"C2"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-MaxHiResTxVramLimit' '"0"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-MaxTxCacheSize' '"8000"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-MultiSampling' '"0"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-OverscanBottom' '"0"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-OverscanLeft' '"0"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-OverscanRight' '"0"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-OverscanTop' '"0"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-pak1' '"rumble"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-pak2' '"none"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-pak3' '"none"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-pak4' '"none"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-parallel-rdp-deinterlace-method' '"Bob"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-parallel-rdp-dither-filter' '"True"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-parallel-rdp-divot-filter' '"True"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-parallel-rdp-downscaling' '"disable"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-parallel-rdp-gamma-dither' '"True"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-parallel-rdp-native-tex-rect' '"True"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-parallel-rdp-native-texture-lod' '"False"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-parallel-rdp-overscan' '"0"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-parallel-rdp-super-sampled-read-back' '"False"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-parallel-rdp-super-sampled-read-back-dither' '"False"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-parallel-rdp-synchronous' '"True"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-parallel-rdp-upscaling' '"1x"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-parallel-rdp-vi-aa' '"True"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-parallel-rdp-vi-bilinear' '"True"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-r-cbutton' '"C1"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-rdp-plugin' '"gliden64"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-RDRAMImageDitheringMode' '"False"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-rsp-plugin' '"hle"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-ThreadedRenderer' '"True"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-txCacheCompression' '"True"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-txEnhancementMode' '"As'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-txFilterIgnoreBG' '"True"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-txFilterMode' '"None"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-txHiresEnable' '"False"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-txHiresFullAlphaChannel' '"False"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-u-cbutton' '"C4"'
	RetroArch_setOverride 'Mupen64Plus-Next.opt' 'Mupen64Plus-Next'  'mupen64plus-virefresh' '"Auto"'
}

RetroArch_Beetle_PSX_HW_setUpCoreOpt(){
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_adaptive_smoothing' '"disabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_analog_calibration' '"disabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_analog_toggle' '"disabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_aspect_ratio' '"corrected"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_cd_access_method' '"sync"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_cd_fastload' '"2x(native)"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_core_timing_fps' '"force_progressive"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_cpu_dynarec' '"disabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_cpu_freq_scale' '"100%(native)"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_crop_overscan' '"smart"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_crosshair_color_p1' '"red"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_crosshair_color_p2' '"blue"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_depth' '"16bpp(native)"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_display_internal_fps' '"disabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_display_vram' '"disabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_dither_mode' '"1x(native)"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_dump_textures' '"disabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_dynarec_eventcycles' '"128"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_dynarec_invalidate' '"full"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_enable_memcard1' '"enabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_enable_multitap_port1' '"disabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_enable_multitap_port2' '"disabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_filter' '"nearest"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_filter_exclude_2d_polygon' '"disabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_filter_exclude_sprite' '"disabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_frame_duping' '"disabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_gpu_overclock' '"1x(native)"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_gte_overclock' '"disabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_gun_cursor' '"cross"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_gun_input_mode' '"lightgun"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_image_crop' '"disabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_image_offset' '"disabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_image_offset_cycles' '"0"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_initial_scanline' '"0"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_initial_scanline_pal' '"0"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_internal_resolution' '"2x"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_last_scanline' '"239"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_last_scanline_pal' '"287"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_line_render' '"default"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_mdec_yuv' '"disabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_memcard_left_index' '"0"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_memcard_right_index' '"1"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_mouse_sensitivity' '"100%"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_msaa' '"1x"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_negcon_deadzone' '"0%"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_negcon_response' '"linear"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_override_bios' '"disabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_pal_video_timing_override' '"disabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_pgxp_2d_tol' '"disabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_pgxp_mode' '"disabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_pgxp_nclip' '"disabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_pgxp_texture' '"disabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_pgxp_vertex' '"disabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_renderer' '"hardware"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_renderer_software_fb' '"enabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_replace_textures' '"disabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_scaled_uv_offset' '"enabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_shared_memory_cards' '"disabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_skip_bios' '"disabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_super_sampling' '"disabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_track_textures' '"disabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_use_mednafen_memcard0_method' '"libretro"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_widescreen_hack' '"enabled"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_widescreen_hack_aspect_ratio' '"16:9"'
	RetroArch_setOverride 'Beetle PSX HW.opt' 'Beetle PSX HW'  'beetle_psx_hw_wireframe' '"disabled"'
}

RetroArch_Flycast_setUpCoreOpt(){
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_allow_service_buttons' '"disabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_alpha_sorting' '"per-triangle'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_analog_stick_deadzone' '"15%"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_anisotropic_filtering' '"4"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_auto_skip_frame' '"disabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_boot_to_bios' '"disabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_broadcast' '"NTSC"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_cable_type' '"TV'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_custom_textures' '"disabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_delay_frame_swapping' '"disabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_digital_triggers' '"disabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_dump_textures' '"disabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_enable_dsp' '"enabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_enable_purupuru' '"enabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_enable_rttb' '"disabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_fog' '"enabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_force_wince' '"disabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_frame_skipping' '"disabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_gdrom_fast_loading' '"disabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_hle_bios' '"disabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_internal_resolution' '"960x720"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_language' '"Default"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_lightgun1_crosshair' '"disabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_lightgun2_crosshair' '"disabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_lightgun3_crosshair' '"disabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_lightgun4_crosshair' '"disabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_mipmapping' '"enabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_oit_abuffer_size' '"512MB"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_per_content_vmus' '"disabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_pvr2_filtering' '"disabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_region' '"Default"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_screen_rotation' '"horizontal"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_show_lightgun_settings' '"disabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_show_vmu_screen_settings' '"disabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_texupscale' '"1"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_texupscale_max_filtered_texture_size' '"256"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_threaded_rendering' '"enabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_trigger_deadzone' '"0%"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_vmu1_pixel_off_color' '"DEFAULT_OFF'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_vmu1_pixel_on_color' '"DEFAULT_ON'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_vmu1_screen_display' '"disabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_vmu1_screen_opacity' '"100%"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_vmu1_screen_position' '"Upper'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_vmu1_screen_size_mult' '"1x"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_vmu2_pixel_off_color' '"DEFAULT_OFF'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_vmu2_pixel_on_color' '"DEFAULT_ON'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_vmu2_screen_display' '"disabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_vmu2_screen_opacity' '"100%"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_vmu2_screen_position' '"Upper'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_vmu2_screen_size_mult' '"1x"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_vmu3_pixel_off_color' '"DEFAULT_OFF'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_vmu3_pixel_on_color' '"DEFAULT_ON'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_vmu3_screen_display' '"disabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_vmu3_screen_opacity' '"100%"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_vmu3_screen_position' '"Upper'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_vmu3_screen_size_mult' '"1x"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_vmu4_pixel_off_color' '"DEFAULT_OFF'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_vmu4_pixel_on_color' '"DEFAULT_ON'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_vmu4_screen_display' '"disabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_vmu4_screen_opacity' '"100%"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_vmu4_screen_position' '"Upper'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_vmu4_screen_size_mult' '"1x"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_volume_modifier_enable' '"enabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_widescreen_cheats' '"disabled"'
	RetroArch_setOverride 'Flycast.opt' 'Flycast'  'reicast_widescreen_hack' '"enabled"'
}

RetroArch_Gambatte_setUpCoreOpt(){
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_audio_resampler' '"sinc"'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_dark_filter_level' '"0"'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_gb_bootloader' '"enabled"'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_gb_colorization' '"auto"'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_gb_hwmode' '"Auto"'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_gb_internal_palette' '"GB'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_gb_link_mode' '"Not'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_gb_link_network_port' '"56400"'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_gb_link_network_server_ip_1' '"0"'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_gb_link_network_server_ip_10' '"0"'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_gb_link_network_server_ip_11' '"0"'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_gb_link_network_server_ip_12' '"0"'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_gb_link_network_server_ip_2' '"0"'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_gb_link_network_server_ip_3' '"0"'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_gb_link_network_server_ip_4' '"0"'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_gb_link_network_server_ip_5' '"0"'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_gb_link_network_server_ip_6' '"0"'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_gb_link_network_server_ip_7' '"0"'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_gb_link_network_server_ip_8' '"0"'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_gb_link_network_server_ip_9' '"0"'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_gb_palette_pixelshift_1' '"PixelShift'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_gb_palette_twb64_1' '"TWB64'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_gb_palette_twb64_2' '"TWB64'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_gbc_color_correction' '"GBC'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_gbc_color_correction_mode' '"accurate"'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_gbc_frontlight_position' '"central"'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_mix_frames' '"disabled"'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_rumble_level' '"10"'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_show_gb_link_settings' '"disabled"'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_turbo_period' '"4"'
	RetroArch_setOverride 'Gambatte.opt' 'Gambatte'  'gambatte_up_down_allowed' '"disabled"'
}

RetroArch_Nestopia_setUpCoreOpt(){
	RetroArch_setOverride 'Nestopia.opt' 'Nestopia'  'nestopia_arkanoid_device' '"mouse"'
	RetroArch_setOverride 'Nestopia.opt' 'Nestopia'  'nestopia_aspect' '"auto"'
	RetroArch_setOverride 'Nestopia.opt' 'Nestopia'  'nestopia_audio_vol_dpcm' '"100"'
	RetroArch_setOverride 'Nestopia.opt' 'Nestopia'  'nestopia_audio_vol_fds' '"100"'
	RetroArch_setOverride 'Nestopia.opt' 'Nestopia'  'nestopia_audio_vol_mmc5' '"100"'
	RetroArch_setOverride 'Nestopia.opt' 'Nestopia'  'nestopia_audio_vol_n163' '"100"'
	RetroArch_setOverride 'Nestopia.opt' 'Nestopia'  'nestopia_audio_vol_noise' '"100"'
	RetroArch_setOverride 'Nestopia.opt' 'Nestopia'  'nestopia_audio_vol_s5b' '"100"'
	RetroArch_setOverride 'Nestopia.opt' 'Nestopia'  'nestopia_audio_vol_sq1' '"100"'
	RetroArch_setOverride 'Nestopia.opt' 'Nestopia'  'nestopia_audio_vol_sq2' '"100"'
	RetroArch_setOverride 'Nestopia.opt' 'Nestopia'  'nestopia_audio_vol_tri' '"100"'
	RetroArch_setOverride 'Nestopia.opt' 'Nestopia'  'nestopia_audio_vol_vrc6' '"100"'
	RetroArch_setOverride 'Nestopia.opt' 'Nestopia'  'nestopia_audio_vol_vrc7' '"100"'
	RetroArch_setOverride 'Nestopia.opt' 'Nestopia'  'nestopia_blargg_ntsc_filter' '"disabled"'
	RetroArch_setOverride 'Nestopia.opt' 'Nestopia'  'nestopia_button_shift' '"disabled"'
	RetroArch_setOverride 'Nestopia.opt' 'Nestopia'  'nestopia_favored_system' '"auto"'
	RetroArch_setOverride 'Nestopia.opt' 'Nestopia'  'nestopia_fds_auto_insert' '"enabled"'
	RetroArch_setOverride 'Nestopia.opt' 'Nestopia'  'nestopia_genie_distortion' '"disabled"'
	RetroArch_setOverride 'Nestopia.opt' 'Nestopia'  'nestopia_nospritelimit' '"disabled"'
	RetroArch_setOverride 'Nestopia.opt' 'Nestopia'  'nestopia_overclock' '"1x"'
	RetroArch_setOverride 'Nestopia.opt' 'Nestopia'  'nestopia_overscan_h' '"disabled"'
	RetroArch_setOverride 'Nestopia.opt' 'Nestopia'  'nestopia_overscan_v' '"enabled"'
	RetroArch_setOverride 'Nestopia.opt' 'Nestopia'  'nestopia_palette' '"cxa2025as"'
	RetroArch_setOverride 'Nestopia.opt' 'Nestopia'  'nestopia_ram_power_state' '"0x00"'
	RetroArch_setOverride 'Nestopia.opt' 'Nestopia'  'nestopia_select_adapter' '"auto"'
	RetroArch_setOverride 'Nestopia.opt' 'Nestopia'  'nestopia_show_advanced_av_settings' '"disabled"'
	RetroArch_setOverride 'Nestopia.opt' 'Nestopia'  'nestopia_show_crosshair' '"enabled"'
	RetroArch_setOverride 'Nestopia.opt' 'Nestopia'  'nestopia_turbo_pulse' '"2"'
	RetroArch_setOverride 'Nestopia.opt' 'Nestopia'  'nestopia_zapper_device' '"lightgun"'
}
RetroArch_bsnes_hd_beta_setUpCoreOpt(){
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_blur_emulation' '"OFF"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_coprocessor_delayed_sync' '"ON"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_coprocessor_prefer_hle' '"ON"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_cpu_fastmath' '"OFF"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_cpu_overclock' '"100"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_cpu_sa1_overclock' '"100"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_cpu_sfx_overclock' '"100"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_dsp_cubic' '"OFF"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_dsp_echo_shadow' '"OFF"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_dsp_fast' '"ON"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_entropy' '"Low"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_hotfixes' '"OFF"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_ips_headered' '"OFF"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_mode7_bgGrad' '"4"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_mode7_igwin' '"outside"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_mode7_igwinx' '"128"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_mode7_mosaic' '"1x'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_mode7_perspective' '"on'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_mode7_scale' '"1x"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_mode7_strWin' '"OFF"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_mode7_supersample' '"none"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_mode7_widescreen' '"16:9"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_mode7_windRad' '"0"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_mode7_wsbg1' '"auto'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_mode7_wsbg2' '"auto'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_mode7_wsbg3' '"auto'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_mode7_wsbg4' '"auto'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_mode7_wsBgCol' '"auto"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_mode7_wsMarker' '"none"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_mode7_wsMarkerAlpha' '"1/1"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_mode7_wsMode' '"all"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_mode7_wsobj' '"safe"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_ppu_deinterlace' '"ON"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_ppu_fast' '"ON"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_ppu_no_sprite_limit' '"ON"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_ppu_no_vram_blocking' '"OFF"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_ppu_show_overscan' '"OFF"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_run_ahead_frames' '"OFF"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_sgb_bios' '"SGB1.sfc"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_video_aspectcorrection' '"OFF"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_video_gamma' '"100"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_video_luminance' '"100"'
	RetroArch_setOverride 'bsnes-hd beta.opt' 'bsnes-hd beta'  'bsnes_video_saturation' '"100"'
}

RetroArch_setUpCoreOptAll(){

	for func in $(compgen -A 'function' | grep '\_setUpCoreOpt$')
		do  $func
	done
}



#BezelOn
RetroArch_bezelOnAll(){
	for func in $(compgen -A 'function' | grep '\_bezelOn$' | grep '^RetroArch_')
		do  $func
	done
}

#BezelOff
RetroArch_bezelOffAll(){
	for func in $(compgen -A 'function' | grep '\_bezelOff$' | grep '^RetroArch_')
		do  $func
	done
}

#finalExec - Extra stuff
RetroArch_finalize(){
	echo "NYI"
}

RetroArch_installCores(){

	#Requests for:
	#GP32
	#N-gage
	#Game.com

	# mkdir -p "$HOME/.var/app/org.libretro.RetroArch/config/retroarch/cores"
	# raUrl="https://buildbot.libretro.com/nightly/linux/x86_64/latest/"
	# RAcores=(bsnes_hd_beta_libretro.so flycast_libretro.so gambatte_libretro.so genesis_plus_gx_libretro.so \
	# 		genesis_plus_gx_wide_libretro.so mednafen_lynx_libretro.so mednafen_ngp_libretro.so mednafen_wswan_libretro.so melonds_libretro.so \
	# 		mesen_libretro.so mgba_libretro.so mupen64Plus-Next_libretro.so nestopia_libretro.so picodrive_libretro.so ppsspp_libretro.so snes9x_libretro.so \
	# 		stella_libretro.so yabasanshiro_libretro.so yabause_libretro.so yabause_libretro.so mame2003_plus_libretro.so mame2010_libretro.so mame_libretro.so \
	# 		melonds_libretro.so fbneo_libretro.so bluemsx_libretro.so desmume_libretro.so sameboy_libretro.so gearsystem_libretro.so mednafen_saturn_libretro.so \
	# 		opera_libretro.so dosbox_core_libretro.so dosbox_pure_libretro.so dosbox_svn_libretro.so puae_libretro.so)
	# setMSG "Downloading RetroArch Cores for EmuDeck"
	# for i in "${RAcores[@]}"
	# do
	# 	FILE=~/.var/app/org.libretro.RetroArch/config/retroarch/cores/${i}
	# 	if [ -f "$FILE" ]; then
	# 		echo "${i}...Already Downloaded"
	# 	else
	# 		curl $raUrl$i.zip --output ~/.var/app/org.libretro.RetroArch/config/retroarch/cores/${i}.zip 
	# 		#rm ~/.var/app/org.libretro.RetroArch/config/retroarch/cores/${i}.zip
	# 		echo "${i}...Downloaded!"
	# 	fi
	# done	
	
	#This is all the cores combined, and dupes taken out.
	RAcores=(81_libretro.so a5200_libretro.so atari800_libretro.so blastem_libretro.so bluemsx_libretro.so bsnes_hd_beta_libretro.so bsnes_libretro.so \
			bsnes_mercury_accuracy_libretro.so cap32_libretro.so chailove_libretro.so citra2018_libretro.so citra_libretro.so crocods_libretro.so desmume2015_libretro.so \
			desmume_libretro.so dolphin_libretro.so dosbox_core_libretro.so dosbox_pure_libretro.so dosbox_svn_libretro.so fbalpha2012_cps1_libretro.so fbalpha2012_cps2_libretro.so \
			fbalpha2012_cps3_libretro.so fbalpha2012_libretro.so fbalpha2012_neogeo_libretro.so fbneo_libretro.so fceumm_libretro.so flycast_libretro.so fmsx_libretro.so \
			freechaf_libretro.so freeintv_libretro.so frodo_libretro.so fuse_libretro.so gambatte_libretro.so gearboy_libretro.so gearsystem_libretro.so \
			genesis_plus_gx_libretro.so genesis_plus_gx_wide_libretro.so gpsp_libretro.so gw_libretro.so handy_libretro.so hatari_libretro.so \
			kronos_libretro.so lutro_libretro.so mame2000_libretro.so mame2003_plus_libretro.so mame2010_libretro.so \
			mame_libretro.so mednafen_lynx_libretro.so mednafen_ngp_libretro.so mednafen_pce_fast_libretro.so mednafen_pce_libretro.so mednafen_pcfx_libretro.so mednafen_psx_hw_libretro.so \
			mednafen_psx_libretro.so mednafen_saturn_libretro.so mednafen_supafaust_libretro.so mednafen_supergrafx_libretro.so mednafen_vb_libretro.so mednafen_wswan_libretro.so \
			melonds_libretro.so mesen-s_libretro.so mesen_libretro.so mgba_libretro.so mu_libretro.so mupen64Plus-Next_libretro.so \
			nekop2_libretro.so neocd_libretro.so nestopia_libretro.so np2kai_libretro.so nxengine_libretro.so o2em_libretro.so \
			opera_libretro.so parallel_n64_libretro.so pcsx2_libretro.so pcsx_rearmed_libretro.so picodrive_libretro.so pokemini_libretro.so ppsspp_libretro.so prboom_libretro.so \
			prosystem_libretro.so puae_libretro.so px68k_libretro.so quasi88_libretro.so quicknes_libretro.so race_libretro.so \
			sameboy_libretro.so scummvm_libretro.so smsplus_libretro.so snes9x2010_libretro.so snes9x_libretro.so squirreljme_libretro.so stella2014_libretro.so \
			stella_libretro.so swanstation_libretro.so tgbdual_libretro.so theodore_libretro.so uzem_libretro.so vba_next_libretro.so vbam_libretro.so vecx_libretro.so \
			vice_x128_libretro.so vice_x64_libretro.so vice_x64sc_libretro.so vice_xscpu64_libretro.so vice_xvic_libretro.so virtualjaguar_libretro.so x1_libretro.so \
			yabasanshiro_libretro.so yabause_libretro.so)
	setMSG "Downloading RetroArch Cores for EmuDeck"
	for i in "${RAcores[@]}"
	do
		FILE=~/.var/app/org.libretro.RetroArch/config/retroarch/cores/${i}
		if [ -f "$FILE" ]; then
			echo "${i}...Already Downloaded"
		else
			curl $raUrl$i.zip --output ~/.var/app/org.libretro.RetroArch/config/retroarch/cores/${i}.zip 
			#rm ~/.var/app/org.libretro.RetroArch/config/retroarch/cores/${i}.zip
			echo "${i}...Downloaded!"
		fi
	done

	
	for entry in ~/.var/app/org.libretro.RetroArch/config/retroarch/cores/*.zip
	do
		 unzip -o "$entry" -d ~/.var/app/org.libretro.RetroArch/config/retroarch/cores/ 
	done
	
	for entry in ~/.var/app/org.libretro.RetroArch/config/retroarch/cores/*.zip
	do
		 rm -f "$entry" 
	done


}

RetroArch_autoSaveOn(){
	changeLine 'savestate_auto_load = ' 'savestate_auto_load = "true"' "$RetroArch_configFile"
	changeLine 'savestate_auto_save = ' 'savestate_auto_save = "true"' "$RetroArch_configFile"
}
RetroArch_autoSaveOn(){
	changeLine 'savestate_auto_load = ' 'savestate_auto_load = "false"' "$RetroArch_configFile"
	changeLine 'savestate_auto_save = ' 'savestate_auto_save = "false"' "$RetroArch_configFile"
}
RetroArch_retroAchievementsOn(){
	changeLine 'cheevos_enable = ' 'cheevos_enable = "true"' "$RetroArch_configFile"
}
RetroArch_retroAchievementsOff(){
	changeLine 'cheevos_enable = ' 'cheevos_enable = "false"' "$RetroArch_configFile"
}
RetroArch_retroAchievementsPromptLogin(){
	text=$(printf "Do you want to use RetroAchievments on Retroarch?\n\n<b>You need to have an account on https://retroachievements.org</b>\n\nActivating RetroAchievments will disable save states unless you disable hardcore mode\n\n\n\nPress STEAM + X to get the onscreen Keyboard\n\n<b>Make sure your RetroAchievments account is validated on the website or RetroArch will crash</b>")	
	RAInput=$(zenity --forms \
			--title="Retroachievements Sign in" \
			--text="$text" \
			--add-entry="Username: " \
			--add-password="Password: " \
			--separator="," 2>/dev/null)
			ans=$?
	if [ $ans -eq 0 ]; then
		echo "RetroAchievment Login"
		echo $RAInput | awk -F "," '{print $1}' > "$HOME/emudeck/.rau"
		echo $RAInput | awk -F "," '{print $2}' > "$HOME/emudeck/.rap"
	else
		echo "Cancel RetroAchievment Login" 
	fi
}
RetroArch_retroAchievementsSetLogin(){
	rap=$(cat ~/emudeck/.rap)
	rau=$(cat ~/emudeck/.rau)
	echo "Evaluate RetroAchievements Login."
	if [ ${#rap} -lt 1 ]; then
		echo "--No password."
	elif [ ${#rau} -lt 1 ]; then
		echo "--No username."
	else
		echo "Valid Retroachievements Username and Password length"
		changeLine 'cheevos_username = ' 'cheevos_username = "'${rau}'"' "$RetroArch_configFile"
		changeLine 'cheevos_password = ' 'cheevos_password = "'${rap}'"' "$RetroArch_configFile"
	fi
}
RetroArch_setSNESAR(){
	AR=$1
	if [ $SNESAR == 43 ]; then	
		RetroArch_snes_ar43
	else
		RetroArch_snes_ar87
	fi	
}
RetroArch_bezelOn(){
	if [ $RABezels == true ]; then	
		RetroArch_bezelOnAll
	else
		RetroArch_bezelOffAll
	fi	
}