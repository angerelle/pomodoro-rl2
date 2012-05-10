package uk.co.dilkusha.config {
import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;

import uk.co.dilkusha.controller.events.PomodoroUserInteractionEvent;
import uk.co.dilkusha.controller.PomodoroStartedCommand;

import uk.co.dilkusha.view.PomodoroStartButton;
import uk.co.dilkusha.view.PomodoroStartButtonMediator;
import uk.co.dilkusha.view.TimeRemainingLabel;
import uk.co.dilkusha.view.TimeRemainingLabelMediator;

/**
 * Robotlegs config for Pomodoro app
 * @author Angela Relle
 */
public class PomodoroConfig {

    [Inject]
    public var mediatorMap:IMediatorMap;

    [Inject]
    public var eventCommandMap:IEventCommandMap;

    public function PomodoroConfig() {
    }

    [PostConstruct]
    public function init():void {
        mediatorMap.map(PomodoroStartButton).toMediator(PomodoroStartButtonMediator);
        mediatorMap.map(TimeRemainingLabel).toMediator(TimeRemainingLabelMediator);
        eventCommandMap.map(PomodoroUserInteractionEvent.POMODORO_STARTED_BY_USER, PomodoroUserInteractionEvent)
                .toCommand(PomodoroStartedCommand);
    }
}
}
