/**
 * Created with IntelliJ IDEA.
 * User: angela.relle
 * Date: 18/05/12
 * Time: 22:37
 * To change this template use File | Settings | File Templates.
 */
package {
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;

import org.flexunit.asserts.fail;

import org.flexunit.async.Async;

import uk.co.dilkusha.controller.events.RemainingTimeChangeEvent;

public class TestCountdown {
    public function TestCountdown() {

    }

    private var pomodoroCountdownService:IEventDispatcher
    [Before]
    public function setUp():void {
        pomodoroCountdownService = new EventDispatcher();
    }

    [After]
    public function tearDown():void {

    }

    [Test(async)]
    public function testCountdownServiceDispatchesRemainingTimeChangedEvent():void {

        pomodoroCountdownService.addEventListener(RemainingTimeChangeEvent.REMAINING_TIME_CHANGED, 
        Async.asyncHandler(this, onRemainingTimeChanged, 1500, null, onTimeout)) ;
        start();
    }

    private function start():void {
                                pomodoroCountdownService.dispatchEvent(new RemainingTimeChangeEvent(RemainingTimeChangeEvent.REMAINING_TIME_CHANGED, Number.NaN));
    }

    private function onRemainingTimeChanged(event:RemainingTimeChangeEvent, passThroughData:Object):void {
    }

    private function onTimeout(passThroughData:Object):void {
        fail("Event never dispatched");
        
    }
}
}
