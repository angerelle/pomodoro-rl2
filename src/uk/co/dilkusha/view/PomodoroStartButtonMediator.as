package uk.co.dilkusha.view {
import flash.events.Event;
import flash.events.MouseEvent;

import robotlegs.bender.bundles.mvcs.Mediator;

import uk.co.dilkusha.PomodoroUserInteractionEvent;

public class PomodoroStartButtonMediator extends Mediator {

    [Inject]
    public var view:PomodoroStartButton;

    public function PomodoroStartButtonMediator() {
    }

    override public function initialize():void {
        addViewListener(MouseEvent.CLICK, onStartButtonClicked);
    }

    protected function onStartButtonClicked(event:MouseEvent):void {
        view.enabled = false;
        dispatch(new PomodoroUserInteractionEvent(PomodoroUserInteractionEvent.POMODORO_STARTED_BY_USER));
    }


}
}
