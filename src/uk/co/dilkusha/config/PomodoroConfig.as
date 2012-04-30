package uk.co.dilkusha.config {
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;

import uk.co.dilkusha.view.PomodoroStartButton;
import uk.co.dilkusha.view.PomodoroStartButtonMediator;

/**
 * Robotlegs config for Pomodoro app
 * @author Angela Relle
 */
public class PomodoroConfig {

    [Inject]
    public var mediatorMap:IMediatorMap;

    public function PomodoroConfig() {
    }

    [PostConstruct]
    public function init():void {
        mediatorMap.mapView(PomodoroStartButton).toMediator(PomodoroStartButtonMediator);
    }
}
}
