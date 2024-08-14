// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: meshtastic/mqtt.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

///
/// This message wraps a MeshPacket with extra metadata about the sender and how it arrived.
public struct ServiceEnvelope: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  ///
  /// The (probably encrypted) packet
  public var packet: MeshPacket {
    get {return _packet ?? MeshPacket()}
    set {_packet = newValue}
  }
  /// Returns true if `packet` has been explicitly set.
  public var hasPacket: Bool {return self._packet != nil}
  /// Clears the value of `packet`. Subsequent reads from it will return its default value.
  public mutating func clearPacket() {self._packet = nil}

  ///
  /// The global channel ID it was sent on
  public var channelID: String = String()

  ///
  /// The sending gateway node ID. Can we use this to authenticate/prevent fake
  /// nodeid impersonation for senders? - i.e. use gateway/mesh id (which is authenticated) + local node id as
  /// the globally trusted nodenum
  public var gatewayID: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _packet: MeshPacket? = nil
}

///
/// Information about a node intended to be reported unencrypted to a map using MQTT.
public struct MapReport: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  ///
  /// A full name for this user, i.e. "Kevin Hester"
  public var longName: String = String()

  ///
  /// A VERY short name, ideally two characters.
  /// Suitable for a tiny OLED screen
  public var shortName: String = String()

  ///
  /// Role of the node that applies specific settings for a particular use-case
  public var role: Config.DeviceConfig.Role = .client

  ///
  /// Hardware model of the node, i.e. T-Beam, Heltec V3, etc...
  public var hwModel: HardwareModel = .unset

  ///
  /// Device firmware version string
  public var firmwareVersion: String = String()

  ///
  /// The region code for the radio (US, CN, EU433, etc...)
  public var region: Config.LoRaConfig.RegionCode = .unset

  ///
  /// Modem preset used by the radio (LongFast, MediumSlow, etc...)
  public var modemPreset: Config.LoRaConfig.ModemPreset = .longFast

  ///
  /// Whether the node has a channel with default PSK and name (LongFast, MediumSlow, etc...)
  /// and it uses the default frequency slot given the region and modem preset.
  public var hasDefaultChannel_p: Bool = false

  ///
  /// Latitude: multiply by 1e-7 to get degrees in floating point
  public var latitudeI: Int32 = 0

  ///
  /// Longitude: multiply by 1e-7 to get degrees in floating point
  public var longitudeI: Int32 = 0

  ///
  /// Altitude in meters above MSL
  public var altitude: Int32 = 0

  ///
  /// Indicates the bits of precision for latitude and longitude set by the sending node
  public var positionPrecision: UInt32 = 0

  ///
  /// Number of online nodes (heard in the last 2 hours) this node has in its list that were received locally (not via MQTT)
  public var numOnlineLocalNodes: UInt32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "meshtastic"

extension ServiceEnvelope: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ServiceEnvelope"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "packet"),
    2: .standard(proto: "channel_id"),
    3: .standard(proto: "gateway_id"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._packet) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.channelID) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.gatewayID) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._packet {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    if !self.channelID.isEmpty {
      try visitor.visitSingularStringField(value: self.channelID, fieldNumber: 2)
    }
    if !self.gatewayID.isEmpty {
      try visitor.visitSingularStringField(value: self.gatewayID, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: ServiceEnvelope, rhs: ServiceEnvelope) -> Bool {
    if lhs._packet != rhs._packet {return false}
    if lhs.channelID != rhs.channelID {return false}
    if lhs.gatewayID != rhs.gatewayID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension MapReport: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MapReport"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "long_name"),
    2: .standard(proto: "short_name"),
    3: .same(proto: "role"),
    4: .standard(proto: "hw_model"),
    5: .standard(proto: "firmware_version"),
    6: .same(proto: "region"),
    7: .standard(proto: "modem_preset"),
    8: .standard(proto: "has_default_channel"),
    9: .standard(proto: "latitude_i"),
    10: .standard(proto: "longitude_i"),
    11: .same(proto: "altitude"),
    12: .standard(proto: "position_precision"),
    13: .standard(proto: "num_online_local_nodes"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.longName) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.shortName) }()
      case 3: try { try decoder.decodeSingularEnumField(value: &self.role) }()
      case 4: try { try decoder.decodeSingularEnumField(value: &self.hwModel) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.firmwareVersion) }()
      case 6: try { try decoder.decodeSingularEnumField(value: &self.region) }()
      case 7: try { try decoder.decodeSingularEnumField(value: &self.modemPreset) }()
      case 8: try { try decoder.decodeSingularBoolField(value: &self.hasDefaultChannel_p) }()
      case 9: try { try decoder.decodeSingularSFixed32Field(value: &self.latitudeI) }()
      case 10: try { try decoder.decodeSingularSFixed32Field(value: &self.longitudeI) }()
      case 11: try { try decoder.decodeSingularInt32Field(value: &self.altitude) }()
      case 12: try { try decoder.decodeSingularUInt32Field(value: &self.positionPrecision) }()
      case 13: try { try decoder.decodeSingularUInt32Field(value: &self.numOnlineLocalNodes) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.longName.isEmpty {
      try visitor.visitSingularStringField(value: self.longName, fieldNumber: 1)
    }
    if !self.shortName.isEmpty {
      try visitor.visitSingularStringField(value: self.shortName, fieldNumber: 2)
    }
    if self.role != .client {
      try visitor.visitSingularEnumField(value: self.role, fieldNumber: 3)
    }
    if self.hwModel != .unset {
      try visitor.visitSingularEnumField(value: self.hwModel, fieldNumber: 4)
    }
    if !self.firmwareVersion.isEmpty {
      try visitor.visitSingularStringField(value: self.firmwareVersion, fieldNumber: 5)
    }
    if self.region != .unset {
      try visitor.visitSingularEnumField(value: self.region, fieldNumber: 6)
    }
    if self.modemPreset != .longFast {
      try visitor.visitSingularEnumField(value: self.modemPreset, fieldNumber: 7)
    }
    if self.hasDefaultChannel_p != false {
      try visitor.visitSingularBoolField(value: self.hasDefaultChannel_p, fieldNumber: 8)
    }
    if self.latitudeI != 0 {
      try visitor.visitSingularSFixed32Field(value: self.latitudeI, fieldNumber: 9)
    }
    if self.longitudeI != 0 {
      try visitor.visitSingularSFixed32Field(value: self.longitudeI, fieldNumber: 10)
    }
    if self.altitude != 0 {
      try visitor.visitSingularInt32Field(value: self.altitude, fieldNumber: 11)
    }
    if self.positionPrecision != 0 {
      try visitor.visitSingularUInt32Field(value: self.positionPrecision, fieldNumber: 12)
    }
    if self.numOnlineLocalNodes != 0 {
      try visitor.visitSingularUInt32Field(value: self.numOnlineLocalNodes, fieldNumber: 13)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: MapReport, rhs: MapReport) -> Bool {
    if lhs.longName != rhs.longName {return false}
    if lhs.shortName != rhs.shortName {return false}
    if lhs.role != rhs.role {return false}
    if lhs.hwModel != rhs.hwModel {return false}
    if lhs.firmwareVersion != rhs.firmwareVersion {return false}
    if lhs.region != rhs.region {return false}
    if lhs.modemPreset != rhs.modemPreset {return false}
    if lhs.hasDefaultChannel_p != rhs.hasDefaultChannel_p {return false}
    if lhs.latitudeI != rhs.latitudeI {return false}
    if lhs.longitudeI != rhs.longitudeI {return false}
    if lhs.altitude != rhs.altitude {return false}
    if lhs.positionPrecision != rhs.positionPrecision {return false}
    if lhs.numOnlineLocalNodes != rhs.numOnlineLocalNodes {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
