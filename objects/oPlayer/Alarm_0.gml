/// @description check reloading
// Alarm 0 event
if (is_reloading) {
    var _is_reloaded = weapon.ammo.reload();
    if (_is_reloaded) {
        play_sfx(sfxReloadDone);
    }
    stop_sfx(sfxReload);
    is_reloading = false;
}