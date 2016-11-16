MyoBuffer myoBuffer;

void setup() {
  frameRate(1);

  try {
    myoBuffer = new MyoBuffer(this);
  } catch (MyoNotDetectectedError e) {
    println("[Error] Could not detect a myo armband, exiting.");
    System.exit(1);
  }
}

void draw() {
  float[] readings = myoBuffer.poll();
  prettyPrint(readings);
}


private void prettyPrint(float[] data) {
  print("[");
  for (int i=0; i<data.length; i++) {
    if (i<data.length-1)
      print(data[i] + " ");
    else
      print(data[i]);
  }
  println("]");
}
