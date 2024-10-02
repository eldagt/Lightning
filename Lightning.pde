import java.util.ArrayList;

class LightningSegment {
  color col;
  int startX;
  int startY;
  int endX;
  int endY;
  boolean isFading; // Flag to check if the segment is fading

  LightningSegment(color col, int startX, int startY, int endX, int endY) {
    this.col = col;
    this.startX = startX;
    this.startY = startY;
    this.endX = endX;
    this.endY = endY;
    this.isFading = true; // Start with fading effect
  }
}

ArrayList<LightningSegment> lightningSegments = new ArrayList<>();
int lightningLength = 10; // Maximum length of each segment

void setup() {
  size(800, 400);         // Set the size of the window
  strokeWeight(2);       // Set the stroke weight for drawing
  background(0);         // Set the background color to black
}

void draw() {
  // Clear the previous frame slightly
  fill(0, 10); // Fill with black, but slightly transparent
  noStroke();
  rect(0, 0, width, height); // Cover the entire window to create a fade effect

  // Draw all lightning segments
  for (LightningSegment segment : lightningSegments) {
    stroke(segment.col);
    line(segment.startX, segment.startY, segment.endX, segment.endY);
    
    // Fade the color of the segment
    if (segment.isFading) {
      segment.col = color(max(0, red(segment.col) - 5), 
                          max(0, green(segment.col) - 5), 
                          max(0, blue(segment.col) - 5));
      // Stop fading if color becomes very dull
      if (red(segment.col) <= 50 && green(segment.col) <= 50 && blue(segment.col) <= 50) {
        segment.isFading = false; // Stop fading when it gets too dull
      }
    }
  }
}

void mousePressed() {
  // Create a new lightning bolt with a random color
  int startX = 0;  
  int startY = 150;
  int endX = startX;
  int endY = startY;

  // Generate a new random color
  color lightningColor = color((int)random(255), (int)random(255), (int)random(255));

  // Create a zig-zag pattern for the new lightning bolt
  while (endX < width) { // Repeat until endX is off the screen
    int segmentX = (int)random(0, lightningLength); // Random segment length
    int segmentY = (int)random(-5, 6); // Small random variation in Y direction
    endX += segmentX; // Move in X direction
    endY += segmentY; // Move in Y direction
    // Add the new segment to the list
    lightningSegments.add(new LightningSegment(lightningColor, startX, startY, endX, endY));
    startX = endX; // Update startX
    startY = endY; // Update startY
  }
}
