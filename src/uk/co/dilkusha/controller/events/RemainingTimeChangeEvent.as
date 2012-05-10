package uk.co.dilkusha.controller.events {

import flash.events.Event;


public class RemainingTimeChangeEvent extends Event {

    public static const REMAINING_TIME_CHANGED:String = "remainingTimeChanged";

    private var _timeRemaining:Number;

    public function get timeRemaining():Number {
        return _timeRemaining;
    }

    public function RemainingTimeChangeEvent(type:String, timeRemaining:Number, bubbles:Boolean = false, cancelable:Boolean = false) {
        _timeRemaining = timeRemaining;
        super(type, bubbles, cancelable);

    }

    override public function clone():Event {
        return new RemainingTimeChangeEvent(type, _timeRemaining,bubbles, cancelable);
    }

}
}
