import rclpy
from rclpy.node import Node
from std_msgs.msg import Empty
import subprocess

class ResetRelay(Node):
    def __init__(self):
        super().__init__('reset_relay')
        self.sub = self.create_subscription(Empty, '/matlab_reset', self.callback, 10)
        self.get_logger().info('Relay di Reset avviato! In attesa di comandi da MATLAB...')

    def callback(self, msg):
        self.get_logger().info('Ricevuto trigger! Teletrasporto il robot...')
        cmd = "ros2 service call /world/map_a/set_pose ros_gz_interfaces/srv/SetEntityPose \"{entity: {name: 'storm', type: 2}, pose: {position: {x: -2.3, y: -3.0, z: 0.5}, orientation: {x: 0.0, y: 0.0, z: 0.707, w: 0.707}}}\""
        subprocess.run(cmd, shell=True)

if __name__ == '__main__':
    rclpy.init()
    node = ResetRelay()
    rclpy.spin(node)
    rclpy.shutdown()
