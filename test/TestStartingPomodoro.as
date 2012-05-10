/**
 * Created with IntelliJ IDEA.
 * User: angela.relle
 * Date: 10/05/12
 * Time: 22:16
 * To change this template use File | Settings | File Templates.
 */
package {
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;

import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.fail;
import org.flexunit.async.Async;

import uk.co.dilkusha.controller.events.PomodoroUserInteractionEvent;
import uk.co.dilkusha.controller.events.RemainingTimeChangeEvent;
import uk.co.dilkusha.controller.PomodoroStartedCommand;
import uk.co.dilkusha.model.PomodoroDefaults;

public class TestStartingPomodoro {

    private static const SECONDS_IN_25_MINS = 1500;

    private var _pomodoroStartedCommand:PomodoroStartedCommand;
    private var _eventDispatcher:IEventDispatcher;

    public function TestStartingPomodoro() {

    }

    [Before]
    public function setUp():void {
        _eventDispatcher = new EventDispatcher();
        _pomodoroStartedCommand = new PomodoroStartedCommand();
        _pomodoroStartedCommand.eventDispatcher = _eventDispatcher;
    }

    [After]
    public function tearDown():void {

    }

    [Test(async)]
    public function testFirstPomodoroStartTriggersTimeChangeTo25Minutes():void {
        _eventDispatcher.addEventListener(RemainingTimeChangeEvent.REMAINING_TIME_CHANGED
                , Async.asyncHandler(this, onTimeChange, 500, PomodoroDefaults.DEFAULT_POMODORO_LENGTH, onTimeout)
                , false, 0, true);
        _pomodoroStartedCommand.execute();
    }

    private function onTimeChange(event:RemainingTimeChangeEvent, passThroughData:Object):void {
        assertEquals(event.timeRemaining, passThroughData);
    }

    private function onTimeout(passThroughData:Object):void {
        fail("Event never dispatched");
    }
}
}
