import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';

async function bootstrap(): Promise<void> {
  const app = await NestFactory.create(AppModule);

  // Swagger setting
  const config = new DocumentBuilder()
    .setTitle('Dentistry Naresuan University')
    .setDescription(
      'API Documentation for Dentistry Naresuan University e-Chart System',
    )
    .setVersion('1.0')
    .build();

  const globalPrefix = 'api';
  app.setGlobalPrefix(globalPrefix);

  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('docs', app, document, {
    useGlobalPrefix: true,
  });

  app.enableCors();
  await app.listen(process.env.PORT!);
  console.log(
    `**** See all APIs at: 'http://localhost:${process.env.PORT}/${globalPrefix}/docs' ****`,
  );
}
bootstrap().catch((err) => {
  console.error('Error during bootstrap:', err);
});
