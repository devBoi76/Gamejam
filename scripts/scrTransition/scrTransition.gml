// Script assets have changed for v2.3.0 see
/// @function   scrTransition(real: from, real: to, real: duration, TransitionType: _type)
function Transition(_from, _to, _duration, _type, _fn_type) constructor{
	progress = 0
	type = _type
	duration = _duration
	from = _from
	to = _to
	fn_type = _fn_type
	
	static step = function(dt) {
		progress += dt
	}
	
	static get = function() {
		return lerp(from, to, get_progress_adjusted())
	}
	
	static get_complete_fraction = function() {
		if (duration == 0) {
			return 1
		} else {
			return progress/ (duration * 1_000)
		}
	}
	
	static get_progress_adjusted = function() {
		switch(fn_type) {
			case FnType.LINEAR: return get_complete_fraction()
			case FnType.EASE: return bezier(0, 0.1, 0.25, 1, get_complete_fraction())
			case FnType.EASE_IN_OUT: return bezier(0, 0, 0.58, 1, get_complete_fraction())
			case FnType.EASE_IN_OUT_BACK: return bezier(0.68, -0.6, 0.32, 1.6, get_complete_fraction())
		}
	}
	
	static is_over = function() {
		return progress >= duration * 1_000
	}
}

enum TransitionType {
	ZOOM = 0,
	POSX = 1,
	POSY = 2,
	POS_LOCK = 3,
}

enum FnType {
	LINEAR,
	EASE,
	EASE_IN_OUT,
	EASE_IN_OUT_BACK,
}

function bezier(P0, P1, P2, P3, t) {
	return power(1-t, 3)*P0 + 3*P1*t*power(1-t, 2) + 3*P2*power(t, 2)*(1-t) + P3 * power(t, 3)
}

