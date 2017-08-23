using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;

class Battery extends Ui.Drawable
{
    hidden var x, y, width, height;

    function initialize(options) {
        x = options[:x];
        y = options[:y];
        width = options[:width];
        height = options[:height];
        Drawable.initialize(options);
    }

    function draw(dc) {
        var batteryLevel = Sys.getSystemStats().battery.toNumber();

        dc.setPenWidth(1);

        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_WHITE);
        // Frame
        dc.drawRectangle(x, y, width, height);
        // Bobbl
        dc.fillRectangle(x + width, y + height/4+1, height/4, height/2);

        var color;
        if (batteryLevel >= 40) {
            color = Gfx.COLOR_WHITE;
        } else if(batteryLevel >= 30){
            color = Gfx.COLOR_WHITE;
        } else if(batteryLevel >= 20){
            color = Gfx.COLOR_WHITE;
        } else {
            color = Gfx.COLOR_WHITE;
        }

        dc.setColor(color, color);
        dc.fillRectangle(x + 1, y + 1, (width - 2) * (batteryLevel*0.01), height - 2);

    }
}
