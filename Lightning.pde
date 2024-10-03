int startX = 0;
int startY = 150;
int endX = 0;
int endY = 150;
int[][] lightningSegments = new int[100][5]; // Store segments: {startX, startY, endX, endY, color}
int segmentCount = 0;
int fadeAmount = 5; // Amount to fade the color

void setup() {
  size(800, 400);         // Set the size of the window
  strokeWeight(2);       // Set the stroke weight for drawing
  background(0);         // Set the background color to black
}

void draw() {
  // Clear the previous frame slightly
  fill(0, 10); // Slightly transparent fill to create a fade effect
  noStroke();
  rect(0, 0, width, height); // Cover the entire window

  // Draw all lightning segments
  for (int i = 0; i < segmentCount; i++) {
    int[] segment = lightningSegments[i];
    
    // Decrease color brightness gradually
    int r = max(0, (segment[4] >> 16) & 0xFF - fadeAmount);
    int g = max(0, (segment[4] >> 8) & 0xFF - fadeAmount);
    int b = max(0, (segment[4]) & 0xFF - fadeAmount);
    
    // Update color
    segment[4] = color(r, g, b);
    
    stroke(segment[4]); // Use the updated color
    line(segment[0], segment[1], segment[2], segment[3]);
  }
}

void mousePressed() {
  // Reset startX, startY, endX, and endY to original values
  startX = 0;
  startY = 150;
  endX = 0;
  endY = 150;
  
  // Generate a new random color for the lightning
  int lightningColor = color((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255));
  
  // Create a zig-zag pattern for the new lightning bolt
  segmentCount = 0; // Reset segment count
  while (endX < width && segmentCount < lightningSegments.length) { // Repeat until endX is off the screen
    endX = startX + (int)(Math.random() * 10); // Random length from 0 to 9
    endY = startY + (int)(Math.random() * 19) - 9; // Random variation from -9 to 9
    
    // Store the new segment
    lightningSegments[segmentCount][0] = startX; // startX
    lightningSegments[segmentCount][1] = startY; // startY
    lightningSegments[segmentCount][2] = endX;   // endX
    lightningSegments[segmentCount][3] = endY;   // endY
    lightningSegments[segmentCount][4] = lightningColor; // color
    
    segmentCount++; // Increment the segment count
    startX = endX; // Update startX
    startY = endY; // Update startY
  }
}
int startX = 0;
int startY = 150;
int endX = 0;
int endY = 150;
int[][] lightningSegments = new int[100][5]; // Store segments: {startX, startY, endX, endY, color}
int segmentCount = 0;
int fadeAmount = 5; // Amount to fade the color

void setup() {
  size(800, 400);         // Set the size of the window
  strokeWeight(2);       // Set the stroke weight for drawing
  background(0);         // Set the background color to black
}

void draw() {
  // Clear the previous frame slightly
  fill(0, 10); // Slightly transparent fill to create a fade effect
  noStroke();
  rect(0, 0, width, height); // Cover the entire window

  // Draw all lightning segments
  for (int i = 0; i < segmentCount; i++) {
    int[] segment = lightningSegments[i];
    
    // Decrease color brightness gradually
    int r = max(0, (segment[4] >> 16) & 0xFF - fadeAmount);
    int g = max(0, (segment[4] >> 8) & 0xFF - fadeAmount);
    int b = max(0, (segment[4]) & 0xFF - fadeAmount);
    
    // Update color
    segment[4] = color(r, g, b);
    
    stroke(segment[4]); // Use the updated color
    line(segment[0], segment[1], segment[2], segment[3]);
  }
}

void mousePressed() {
  // Reset startX, startY, endX, and endY to original values
  startX = 0;
  startY = 150;
  endX = 0;
  endY = 150;
  
  // Generate a new random color for the lightning
  int lightningColor = color((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255));
  
  // Create a zig-zag pattern for the new lightning bolt
  segmentCount = 0; // Reset segment count
  while (endX < width && segmentCount < lightningSegments.length) { // Repeat until endX is off the screen
    endX = startX + (int)(Math.random() * 10); // Random length from 0 to 9
    endY = startY + (int)(Math.random() * 19) - 9; // Random variation from -9 to 9
    
    // Store the new segment
    lightningSegments[segmentCount][0] = startX; // startX
    lightningSegments[segmentCount][1] = startY; // startY
    lightningSegments[segmentCount][2] = endX;   // endX
    lightningSegments[segmentCount][3] = endY;   // endY
    lightningSegments[segmentCount][4] = lightningColor; // color
    
    segmentCount++; // Increment the segment count
    startX = endX; // Update startX
    startY = endY; // Update startY
  }
}
