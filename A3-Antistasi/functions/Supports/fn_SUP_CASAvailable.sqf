params ["_side"];

//if(tierWar < 4) exitWith {-1};

//Select a timer index and the max number of timers available
private _timerIndex = -1;
private _playerAdjustment = ceil (sqrt (count allPlayers));

//Search for a timer which allows the support to be fired
if(_side == Occupants) then
{
    if(isNil "occupantsCASTimer") then
    {
        occupantsCASTimer = [];
    };
    if(count occupantsCASTimer < _playerAdjustment) then
    {
        _timerIndex = count occupantsCASTimer;
        for "_i" from ((count occupantsCASTimer) + 1) to _playerAdjustment do
        {
            occupantsCASTimer pushBack -1;
        };
    }
    else
    {
        _timerIndex = occupantsCASTimer findIf {_x < time};
        if(_playerAdjustment <= _timerIndex) then
        {
            _timerIndex = -1;
        };
    };
};
if(_side == Invaders) then
{
    if(isNil "invadersCASTimer") then
    {
        invadersCASTimer = [];
    };
    if(count invadersCASTimer < _playerAdjustment) then
    {
        _timerIndex = count invadersCASTimer;
        for "_i" from ((count invadersCASTimer) + 1) to _playerAdjustment do
        {
            invadersCASTimer pushBack -1;
        };
    }
    else
    {
        _timerIndex = invadersCASTimer findIf {_x < time};
        if(_playerAdjustment <= _timerIndex) then
        {
            _timerIndex = -1;
        };
    };
};

_timerIndex;
