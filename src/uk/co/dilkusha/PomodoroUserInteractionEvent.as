package uk.co.dilkusha {
import flash.events.Event;

public class PomodoroUserInteractionEvent extends Event {

    public static const POMODORO_STARTED_BY_USER:String = "pomodoroStartedByUser";

    public function PomodoroUserInteractionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) {
        super(type, bubbles ,cancelable);
    }

    override public function clone():Event {
        return new PomodoroUserInteractionEvent(type,  bubbles, cancelable);
    }
}
}
