::#! 2> /dev/null                                   #
@ 2>/dev/null # 2>nul & echo off & goto BOF         #
if [ -z ${SIREUM_HOME} ]; then                      #
  echo "Please set SIREUM_HOME env var"             #
  exit -1                                           #
fi                                                  #
exec ${SIREUM_HOME}/bin/sireum slang run "$0" "$@"  #
:BOF
setlocal
if not defined SIREUM_HOME (
  echo Please set SIREUM_HOME env var
  exit /B -1
)
%SIREUM_HOME%\bin\sireum.bat slang run "%0" %*
exit /B %errorlevel%
::!#
// #Sireum

import org.sireum._
import org.sireum.presentasi._
import org.sireum.presentasi.Presentation._

import Util._

val home = Os.slashDir.up.canon
val resources = home / "jvm" / "src" / "main" / "resources"
val image = resources / "image"
val video = resources / "video"

var entries: ISZ[Entry] = ISZ()
def addVideo(path: String, delay: Z, volume: F64, rate: F64, start: F64, end: F64, textOpt: Option[String]): Unit = {
  entries = entries :+ Video(path, delay, volume, rate, start, end, textOpt)
}
def addStill(path: String, start: F64, end: F64): Unit = {
  entries = entries :+ Video(path, 0, 1.0, 1.0, start, end, None())
}

var start = 0.0
var end = 0.1
var text =
    s"""
       Modifying the declarative model can be accomplished via the graphical editor
     """

var path = (video / "iter1.mp4").string

addVideo(
  path = path,
  delay = 1500,
  volume = 1.0,
  rate = 1.0,
  start = start,
  end = end,
  textOpt = Some(text)
)



end = 21.0 * 1000.0
text = 
    s"""
For example, we can split the current temp event data port connection between the tempSensor and tempControl
into separate event and data port connections by first changing the existing event data ports into just data ports.
To do this, select each port and from the AADL tab change the Type to Data Port
     """

addVideo(
  path = path,
  delay = 0,
  volume = 1.0,
  rate = 1.0,
  start = start,
  end = end,
  textOpt = Some(text)
)


start = end
end = 32.0 * 1000.0
text = s"""Now we need to add the event ports.  From the features pallet select Event Port and click on the tcp process component.
Add another event port to the tempControl thread.
"""

     
addVideo(
  path = path,
  delay = 0,
  volume = 1.0,
  rate = 1.0,
  start = start,
  end = end,
  textOpt = Some(text)
)


start = end
end = 51.0 * 1000.0
text = s"""The ports can be renamed by right clicking and choosing rename
"""


addVideo(
  path = path,
  delay = 0,
  volume = 1.0,
  rate = 1.0,
  start = start,
  end = end,
  textOpt = Some(text)
)



start = end
end = 59.0 * 1000.0
text = s"Now connect the ports by selecting ‘Feature Connection’ from the Connections pallet and connect the two ports."

addVideo(
  path = path,
  delay = 0,
  volume = 1.0,
  rate = 1.0,
  start = start,
  end = end,
  textOpt = Some(text)
)


// TODO: would rather have video5 last for the full (63 - 51) seconds
// but it only lasts long enough to play the audio
start = end
end = 63.0 * 1000.0

addVideo(
  path = path,
  delay = 0,
  volume = 1.0,
  rate = 1.0,
  start = start,
  end = end,
  textOpt = None()
)

/**************************************************************
*
*/
path = (video / "iter2.mp4").string
text = s"""
Changes to the model can also be accomplished via the text editor.  First we add the remaining event ports
"""

start = 0.0
end = 13.0 * 1000.0

addVideo(
  path = path,
  delay = 0,
  volume = 1.0,
  rate = 1.0,
  start = start,
  end = end,
  textOpt = Some(text)
)

text = s"And then add the connections"

start = end
end = 47.0 * 1000.0

addVideo(
  path = path,
  delay = 0,
  volume = 1.0,
  rate = 1.0,
  start = start,
  end = end,
  textOpt = Some(text)
)

start = 39.0 * 1000.0
end = 47.0 * 1000.0
addStill(path, start, end)

val presentation = Presentation.empty ++ entries

presentation.cli(Os.cliArgs)


object Util {

}
