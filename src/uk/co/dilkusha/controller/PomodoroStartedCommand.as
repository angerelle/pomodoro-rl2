/**
 * Created with IntelliJ IDEA.
 * User: angela.relle
 * Date: 10/05/12
 * Time: 23:21
 * To change this template use File | Settings | File Templates.
 */
package uk.co.dilkusha.controller {
import flash.events.IEventDispatcher;

import robotlegs.bender.bundles.mvcs.Command;

import uk.co.dilkusha.controller.events.RemainingTimeChangeEvent;
import uk.co.dilkusha.model.PomodoroDefaults;

public class PomodoroStartedCommand extends Command {

    [Inject]
    public var eventDispatcher:IEventDispatcher;

    public function PomodoroStartedCommand() {
    }

    override public function execute():void {
        eventDispatcher.dispatchEvent(new RemainingTimeChangeEvent(RemainingTimeChangeEvent.REMAINING_TIME_CHANGED,
                PomodoroDefaults.DEFAULT_POMODORO_LENGTH));

    }
}
}
