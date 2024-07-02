
//@description find index of variable in struct with name
//@param _list_of_variables Struct
//@param _name_of_variable string
function find_index_of_variable(_list_of_variables, _name_of_variable)
{
	var _names = struct_get_names(_list_of_variables);
	show_debug_message(_names);
	var _index = -1;
	var _array_size = array_length(_names);
	for (var _i = 0; _i < _array_size; _i++) {
	    if (_names[_i] == _name_of_variable) {
			_index = _i;
			break;
	    }
	}
	if (_index == -1)
	{
		show_debug_message("Weapon not found");		
	}
	return _index;

	
}