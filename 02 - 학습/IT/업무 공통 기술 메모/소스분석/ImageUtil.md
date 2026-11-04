---
별칭:
  - "학습 - ImageUtil"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/98e387c3ca2d4a21bfd282af9bae7445
---

# 학습: ImageUtil

## 세부 내용

```java
package com.awasoft.safety.fsms.config.web.util;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;

import javax.imageio.ImageIO;

import org.apache.poi.util.Units;
import org.apache.poi.xssf.usermodel.XSSFClientAnchor;
import org.apache.poi.xssf.usermodel.XSSFDrawing;
import org.apache.poi.xssf.usermodel.XSSFPicture;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ImageUtil {

    public void drawImageExcel(XSSFWorkbook workBook, XSSFSheet sheet, HashMap<String, Object> data, int row, int cell, int width, int height) {
        String rootPath = System.getProperty("user.dir");
        byte[] bytes;
        int imgIndex = 0;
        InputStream fis;
        String filePath = String.valueOf(data.get("sysFilePath"));
        String imgFileName = String.valueOf(data.get("sysFileNm"));
        String fileExt = String.valueOf(data.get("fileExt"));
        String fileFullPath = rootPath+filePath+"/"+imgFileName+"."+fileExt;

        try {
            fis = new FileInputStream(fileFullPath);

            BufferedImage orgImg = ImageIO.read(fis);
            bytes = resizeImage(orgImg, fileExt, width, height);

            // 확장자 체크
            if("jpg".equalsIgnoreCase(fileExt) || "jpeg".equalsIgnoreCase(fileExt)) {
                imgIndex = workBook.addPicture(bytes, XSSFWorkbook.PICTURE_TYPE_JPEG);
            } else if("gif".equalsIgnoreCase(fileExt)) {
                imgIndex = workBook.addPicture(bytes, XSSFWorkbook.PICTURE_TYPE_GIF);
            } else if("png".equalsIgnoreCase(fileExt)) {
                imgIndex = workBook.addPicture(bytes, XSSFWorkbook.PICTURE_TYPE_PNG);
            }

            XSSFClientAnchor anchor = new XSSFClientAnchor();
            XSSFDrawing drawing = sheet.createDrawingPatriarch();

            // 이미지 위치 설정
            anchor.setDx1(3 * Units.EMU_PER_PIXEL);
            anchor.setDy1(2 * Units.EMU_PER_PIXEL);
            anchor.setRow1(row);
            anchor.setCol1(cell);

            // 엑셀에 이미지 생성
            XSSFPicture pic = drawing.createPicture(anchor, imgIndex);
            pic.resize();
        } catch (IOException e) {
            log.debug("이미지 파일 없음");
        }
    }

    /**
     * 이미지 사이즈 변환
     * @param orgImage BufferedImage
     * @param  fileExt String
     * @param  maxWidth int
     * @param  maxHeight int
     * @return ModelAndView
     */
    public byte[] resizeImage(BufferedImage orgImage, String fileExt, int maxWidth, int maxHeight) {
        BufferedImage resizeImg = null;
        ByteArrayOutputStream bArr = new ByteArrayOutputStream();

        try {
            int imageWidth = orgImage.getWidth();
            int imageHeight = orgImage.getHeight();

            if (imageWidth > maxWidth) {
                float widthRatio = maxWidth / (float) imageWidth;
                imageWidth = (int) (imageWidth * widthRatio);
                imageHeight = (int) (imageHeight * widthRatio);
            }

            if (imageHeight > maxHeight) {
                float heightRatio = maxHeight / (float) imageHeight;
                imageWidth = (int) (imageWidth * heightRatio);
                imageHeight = (int) (imageHeight * heightRatio);
            }

            Image img = orgImage.getScaledInstance(imageWidth, imageHeight, Image.SCALE_SMOOTH);
            int imgType = orgImage.getType() == 0? BufferedImage.TYPE_INT_ARGB : orgImage.getType();
            resizeImg = new BufferedImage(imageWidth, imageHeight, imgType);

            Graphics2D g2d = resizeImg.createGraphics();
            g2d.drawImage(img, 0, 0, null);
            g2d.dispose();

            ImageIO.write((resizeImg != null) ? resizeImg : orgImage, fileExt, bArr);

            return bArr.toByteArray();
        } catch (IOException e) {
            log.debug("이 파일은 사이즈를 변경할 수 없습니다. 파일을 확인해주세요.");
            return null;
        } catch (Exception e) {
            log.debug("이 파일은 사이즈를 변경할 수 없습니다. 파일을 확인해주세요.");
            return null;
        } finally {
            try {
                bArr.close();
            } catch (IOException e) {
                log.debug("이 파일은 사이즈를 변경할 수 없습니다. 파일을 확인해주세요.");
            }
        }
    }
}
```

- 이 클래스는 이미지 파일을 엑셀 문서에 삽입하거나 이미지의 크기를 조정하는 기능을 제공
1. **`drawImageExcel`** 메서드
    - 이 메서드는 엑셀 문서에 이미지를 삽입하는 기능을 수행합니다.
    - 주어진 **`workBook`**(XSSFWorkbook), **`sheet`**(XSSFSheet), **`data`**(HashMap)를 사용하여 이미지 파일의 경로를 가져오고,
    - 해당 이미지를 엑셀 문서에 삽입합니다.
2. **`resizeImage`** 메서드
    - 이 메서드는 이미지의 크기를 조정하는 기능을 수행합니다.
    - 주어진 **`orgImage`**(BufferedImage), **`fileExt`**(String), **`maxWidth`**(int), **`maxHeight`**(int)를 사용하여 이미지의 크기를 조정하고,
    - 조정된 이미지를 바이트 배열로 반환합니다.
    - 이미지의 가로 또는 세로 크기가 주어진 최대값보다 큰 경우에만 크기를 조정합니다.

이 클래스는 이미지를 처리하기 위해 Java의 **`ImageIO`**와 **`BufferedImage`**, **`Graphics2D`** 등을 사용합니다. 또한 엑셀 문서에 이미지를 삽입하기 위해 Apache POI 라이브러리를 사용하고 있습니다.

이 코드는 이미지 처리와 엑셀 문서 작업에 유용한 기능들을 제공하며, 이미지를 엑셀에 삽입하거나 크기를 조정해야 하는 상황에서 활용될 수 있습니다.

## 관련 노트

- 상위: [[02 - 학습/IT/업무 공통 기술 메모/공통 기술 메모 (Spring·타임리프·DB·SSL 등)|공통 기술 메모 (Spring·타임리프·DB·SSL 등)]]
