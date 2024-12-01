provider "google" {
    credentials = file("high-keel-443318-r0-c5011fb62a8f.json")
    project = "high-keel-443318-r0"
    region = "us-central1" 
    zone = "us-central1-a"
}