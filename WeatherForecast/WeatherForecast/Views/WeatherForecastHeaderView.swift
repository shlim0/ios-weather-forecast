import UIKit
import CoreLocation

protocol WeatherForecastHeaderViewIdentifying {
    static var identifier: String { get }
}

extension WeatherForecastHeaderViewIdentifying {
    static var identifier: String { String(describing: WeatherForecastHeaderView.self) }
}

protocol WeatherForecastHeaderViewConfigurable {
    func configure(_ placemark: CLPlacemark?, using model: Model.CurrentWeather?)
}

final class WeatherForecastHeaderView: UICollectionReusableView {
    weak var delegate: WeatherForecastViewController?
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "-"
        label.textColor = .white
        
        return label
    }()
    
    private lazy var locationConfigurationButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.addTarget(delegate, action: #selector(delegate?.touchLocationConfigurationButton), for: .touchUpInside)
        
        return button
    }()
    
    private let temperatureMinMaxLabel: UILabel = {
        let label = UILabel()
        label.text = "-"
        label.textColor = .white
        
        return label
    }()
    
    private let temperatureCurrentLabel: UILabel = {
        let label = UILabel()
        label.text = "-"
        label.textColor = .white
        label.font = .systemFont(ofSize: 30, weight: .bold)
        
        return label
    }()
    
    private lazy var locationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.addArrangedSubview(locationLabel)
        stackView.addArrangedSubview(locationConfigurationButton)
        
        return stackView
    }()
    
    private lazy var partialInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(locationStackView)
        stackView.addArrangedSubview(temperatureMinMaxLabel)
        
        return stackView
    }()
    
    private lazy var totalInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(partialInfoStackView)
        stackView.addArrangedSubview(temperatureCurrentLabel)
        
        return stackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(totalInfoStackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureUI() {
        backgroundColor = .clear
        addSubview(stackView)
    }
    
    private func configureConstraints() {
        stackViewConstraint()
        totalInfoStackViewConstraint()
        imageViewConstraint()
    }
    
    private func stackViewConstraint() {
        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
    
    private func totalInfoStackViewConstraint() {
        totalInfoStackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
    }
    
    private func imageViewConstraint() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: stackView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
    }
}

extension WeatherForecastHeaderView: WeatherForecastHeaderViewConfigurable {
    func configure(_ placemark: CLPlacemark?, using model: Model.CurrentWeather?) {
        guard let model = model,
              let placemark = placemark else { return }
        
        guard let imageType = model.weather?[0].icon else { return }
        
        guard let locality = placemark.locality
                ?? placemark.subAdministrativeArea else { return }
        
        guard let subLocality = placemark.subLocality else { return }
        
        guard let temperatureMin = model.main?.tempMin,
              let temperatureMax = model.main?.tempMax,
              let temperatureCurrent = model.main?.temp else { return }
        
        locationConfigurationButton.setTitle("위치설정", for: .normal)
        
        
        UIImageView.load(from: imageType) { [weak self] image in
            guard let self = self else { return }
            configure(image: image, locality: locality, subLocality: subLocality, temperatureMin: temperatureMin, temperatureMax: temperatureMax, temperatureCurrent: temperatureCurrent)
        }
    }
    
    private func configure(image: UIImage, locality: String, subLocality: String, temperatureMin: Double, temperatureMax: Double, temperatureCurrent: Double) {
        imageView.image = image
        locationLabel.text = locality + " " + subLocality
        temperatureMinMaxLabel.text = "최저 " + String(format: "%.1fº", temperatureMin) +  " 최고 " + String(format: "%.1fº", temperatureMax)
        temperatureCurrentLabel.text = String(format: "%.1fº", temperatureCurrent)
    }
}

extension WeatherForecastHeaderView: WeatherForecastHeaderViewIdentifying {
    
}
