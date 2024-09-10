import Vision

public protocol ResultsListener {
  func on(predictions: [[String: Any]])
}

public protocol InferenceTimeListener {
  func on(inferenceTime: Double)
}

public protocol FpsRateListener {
  func on(fpsRate: Double)
}

public protocol Predictor {
  func predict(
    sampleBuffer: CMSampleBuffer, onResultsListener: ResultsListener?,
    onInferenceTime: InferenceTimeListener?, onFpsRate: FpsRateListener?)

  func predictOnImage(image: CIImage, height: Double?, width: Double?,
    aspectRatio: Double?, completion: ([[String: Any]]) -> Void)
}

public enum PredictorError: Error {
  case invalidTask
  case noLabelsFound
  case invalidUrl
}
