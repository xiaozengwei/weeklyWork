package com.gx.soft.common.util;

import com.google.zxing.*;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.geom.RoundRectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;

import java.util.Hashtable;

public class QrCodeCreateUtil {

	private static final String CHARSET = "utf-8";
	private static final String FORMAT_NAME = "JPG";
	// 二维码尺寸
	private static final int QRCODE_SIZE = 300;
	// LOGO宽度
	private static final int WIDTH = 60;
	// LOGO高度
	private static final int HEIGHT = 60;

//	/**
//	 * 生成包含字符串信息的二维码图片
//	 * @param outputStream 输出流
//	 * @param content 字符串信息
//	 * @param qrCodeSize 二维码图片大小
//	 * @param imageFormat 二维码的格式
//	 * @return
//	 * @throws WriterException
//	 * @throws IOException
//	 */
//	public static boolean createQrCode(OutputStream outputStream, String content, int qrCodeSize, String imageFormat) throws WriterException, IOException{
//		//设置二维码纠错级别Map
//		Hashtable<EncodeHintType, ErrorCorrectionLevel> hintMap = new Hashtable<EncodeHintType, ErrorCorrectionLevel>();
//		hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);  // 矫错级别
//		QRCodeWriter qrCodeWriter = new QRCodeWriter();
//		//创建比特矩阵(位矩阵)的QR码编码的字符串
//		BitMatrix byteMatrix = qrCodeWriter.encode(content, BarcodeFormat.QR_CODE, qrCodeSize, qrCodeSize, hintMap);
//		// 使BufferedImage勾画QRCode  (matrixWidth 是行二维码像素点)
//		int matrixWidth = byteMatrix.getWidth();
//		BufferedImage image = new BufferedImage(matrixWidth-200, matrixWidth-200, BufferedImage.TYPE_INT_RGB);
//		image.createGraphics();
//		Graphics2D graphics = (Graphics2D) image.getGraphics();
//		graphics.setColor(Color.WHITE);
//		graphics.fillRect(0, 0, matrixWidth, matrixWidth);
//		// 使用比特矩阵画并保存图像
//		graphics.setColor(Color.BLACK);
//		for (int i = 0; i < matrixWidth; i++){
//			for (int j = 0; j < matrixWidth; j++){
//				if (byteMatrix.get(i, j)){
//					graphics.fillRect(i-100, j-100, 1, 1);
//				}
//			}
//		}
//		return ImageIO.write(image, imageFormat, outputStream);
//	}



	private static BufferedImage createImage(String content, String imgPath, boolean needCompress) throws Exception {
		Hashtable hints = new Hashtable();
		hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
		hints.put(EncodeHintType.CHARACTER_SET, CHARSET);
		hints.put(EncodeHintType.MARGIN, 1);
		BitMatrix bitMatrix = new MultiFormatWriter().encode(content, BarcodeFormat.QR_CODE, QRCODE_SIZE, QRCODE_SIZE,
				hints);
		int width = bitMatrix.getWidth();
		int height = bitMatrix.getHeight();
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		for (int x = 0; x < width; x++) {
			for (int y = 0; y < height; y++) {
				image.setRGB(x, y, bitMatrix.get(x, y) ? 0xFF000000 : 0xFFFFFFFF);
			}
		}
		if (imgPath == null || "".equals(imgPath)) {
			return image;
		}
		// 插入图片
		QrCodeCreateUtil.insertImage(image, imgPath, needCompress);
		return image;
	}

	private static void insertImage(BufferedImage source, String imgPath, boolean needCompress) throws Exception {
		File file = new File(imgPath);
		if (!file.exists()) {
			System.err.println("" + imgPath + "   该文件不存在！");
			return;
		}
		Image src = ImageIO.read(new File(imgPath));
		int width = src.getWidth(null);
		int height = src.getHeight(null);
		if (needCompress) { // 压缩LOGO
			if (width > WIDTH) {
				width = WIDTH;
			}
			if (height > HEIGHT) {
				height = HEIGHT;
			}
			Image image = src.getScaledInstance(width, height, Image.SCALE_SMOOTH);
			BufferedImage tag = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
			Graphics g = tag.getGraphics();
			g.drawImage(image, 0, 0, null); // 绘制缩小后的图
			g.dispose();
			src = image;
		}
		// 插入LOGO
		Graphics2D graph = source.createGraphics();
		int x = (QRCODE_SIZE - width) / 2;
		int y = (QRCODE_SIZE - height) / 2;
		graph.drawImage(src, x, y, width, height, null);
		Shape shape = new RoundRectangle2D.Float(x, y, width, width, 6, 6);
		graph.setStroke(new BasicStroke(3f));
		graph.draw(shape);
		graph.dispose();
	}

	public static void encode(String content, String imgPath, String destPath, boolean needCompress) throws Exception {
		BufferedImage image = QrCodeCreateUtil.createImage(content, imgPath, needCompress);
		mkdirs(destPath);
		// String file = new Random().nextInt(99999999)+".jpg";
		// ImageIO.write(image, FORMAT_NAME, new File(destPath+"/"+file));
		ImageIO.write(image, FORMAT_NAME, new File(destPath));
	}

	public static BufferedImage encode(String content, String imgPath, boolean needCompress) throws Exception {
		BufferedImage image = QrCodeCreateUtil.createImage(content, imgPath, needCompress);
		return image;
	}

	public static void mkdirs(String destPath) {
		File file = new File(destPath);
		// 当文件夹不存在时，mkdirs会自动创建多层目录，区别于mkdir．(mkdir如果父目录不存在则会抛出异常)
		if (!file.exists() && !file.isDirectory()) {
			file.mkdirs();
		}
	}

	public static void encode(String content, String imgPath, String destPath) throws Exception {
		QrCodeCreateUtil.encode(content, imgPath, destPath, false);
	}

	public static void encode(String content, String destPath) throws Exception {
		QrCodeCreateUtil.encode(content, null, destPath, false);
	}

	public static void encode(String content, String imgPath, OutputStream output, boolean needCompress) throws Exception {
		BufferedImage image = QrCodeCreateUtil.createImage(content, imgPath, needCompress);
		ImageIO.write(image, FORMAT_NAME, output);
	}

	public static void encode(String content, OutputStream output) throws Exception {
		QrCodeCreateUtil.encode(content, null, output, false);
	}

	public static String decode(File file) throws Exception {
		BufferedImage image;
		image = ImageIO.read(file);
		if (image == null) {
			return null;
		}
		BufferedImageLuminanceSource source = new BufferedImageLuminanceSource(image);
		BinaryBitmap bitmap = new BinaryBitmap(new HybridBinarizer(source));
		Result result;
		Hashtable hints = new Hashtable();
		hints.put(DecodeHintType.CHARACTER_SET, CHARSET);
		result = new MultiFormatReader().decode(bitmap, hints);
		String resultStr = result.getText();
		return resultStr;
	}

	public static String decode(String path) throws Exception {
		return QrCodeCreateUtil.decode(new File(path));
	}

}
