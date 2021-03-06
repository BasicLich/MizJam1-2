extends Modifier

class_name ModifierGotoTurn

export(int) var _nextTurn
export(int) var _nextPart
var _previousTurn
var _previousPart

func _init(turnNum:int = 0, part:int = 0):
	_nextTurn = turnNum
	_nextPart = part

func execute(game):
	.execute(game)
	_previousTurn = game._timeline.current_turn_num
	_previousPart = game._timeline.current_part
	game.gotoTurn(_nextTurn, _nextPart)

func undo(game):
	.undo(game)
	game.gotoTurn(_previousTurn, _previousPart)

func copy():
	var ret = get_script().new(_nextTurn, _nextPart)
	ret._previousTurn = _previousTurn
	ret._previousPart = _previousPart
	ret.propagate = propagate
	ret.silent = silent
	return ret
