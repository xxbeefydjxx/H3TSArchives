//343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343
//
// Mission: m60
// Script for infinity elevator device machine.
//										
//343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343

script startup instanced f_init()
	print ("infinity elevator has been set up");
	device_set_position_track(this, 'any:lift', 0);
end

script static instanced void f_animate()
	print ("infinity elevator going up");
	device_animate_position (this, 1, 20.0, 0.1, 0.1, TRUE);

end
