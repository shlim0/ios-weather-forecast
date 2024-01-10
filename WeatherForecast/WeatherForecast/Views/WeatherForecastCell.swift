import UIKit

protocol WeatherForecastCellIdentifying {
    static var identifier: String { get }
}

extension WeatherForecastCellIdentifying {
    static var identifier: String { String(describing: WeatherForecastCell.self) }
}

protocol WeatherForecastCellConfigurable {
    func configure(using model: Model.FiveDaysWeather.List?)
}

final class WeatherForecastCell: UICollectionViewListCell {
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        
        return label
    }()
    
    private let temperatureCurrentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white

        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var cellRightStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.addArrangedSubview(temperatureCurrentLabel)
        stackView.addArrangedSubview(imageView)
        
        return stackView
    }()
    
    private lazy var cellTotalStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(cellRightStackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureConstraint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    private func configureUI() {
        backgroundConfiguration = .clear()
        addSubview(cellTotalStackView)
    }
    
    private func configureConstraint() {
        setStackViewConstraint()
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
    }
    
    private func setStackViewConstraint() {
        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            cellTotalStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            cellTotalStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            cellTotalStackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            cellTotalStackView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}

extension WeatherForecastCell: WeatherForecastCellConfigurable {
    func configure(using model: Model.FiveDaysWeather.List?) {
        guard let model = model else { return }
        guard let imageType = model.weather?[0].icon else { return }
        guard let date = model.dt else { return }
        
        let dateString = DateFormatter.toString(by: date)

        guard let temperatureCurrent = model.main?.temp else { return }
        
        UIImageView.load(from: imageType) { [weak self] image in
            guard let self = self else { return }
            configure(image: image, date: dateString, temperatureCurrent: temperatureCurrent)
        }
    }

    private func configure(image: UIImage, date: String, temperatureCurrent: Double) {
        imageView.image = image
        dateLabel.text = date
        temperatureCurrentLabel.text = String(format: "%.1fº", temperatureCurrent)
    }
}

extension WeatherForecastCell: WeatherForecastCellIdentifying {
    
}
