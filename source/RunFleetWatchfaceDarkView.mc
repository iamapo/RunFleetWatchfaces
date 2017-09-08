using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Time as Time;
using Toybox.Time.Gregorian as Calendar;

class RunFleetWatchfaceDarkView extends Ui.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        // Get and show the current time
        var now = Time.now();
        var clockTime = Sys.getClockTime();
        var timeString = Lang.format("$1$:$2$", [clockTime.hour.format("%02d"), clockTime.min.format("%02d")]);
        var view = View.findDrawableById("TimeLabel");
        view.setText(timeString);
        var date = Calendar.info(now, Time.FORMAT_LONG);
        var dateString = Lang.format("$1$. $2$", [date.day, date.month]);
        View.findDrawableById("DateLabel")
            .setText(dateString);
        

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        
        // Show Bluetooth Icon when connected
        var BTstatusBitmap;
        var devSettings = Sys.getDeviceSettings();
        if (devSettings.phoneConnected) { 
	 		BTstatusBitmap = Ui.loadResource(Rez.Drawables.ConnectIcon);
        } else {
	 		BTstatusBitmap = Ui.loadResource(Rez.Drawables.DisconnectIcon);
	 	}
	 	
	 	var btstatusView = View.findDrawableById("id_btstatus");
        dc.drawBitmap(btstatusView.locX, btstatusView.locY, BTstatusBitmap);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}
