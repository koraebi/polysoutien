import { Component, HostListener } from '@angular/core';
import { AnnouncementService } from './announcement.service';
import { HelpService } from './help-definition/help.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent{
  title = 'WebFront';
  
  public getScreenWidth: any;
  public getScreenHeight: any;
  public isMobile: boolean = false;

  constructor(private annonceService: AnnouncementService, private helpService: HelpService) { }
  
  ngOnInit() {
      this.getScreenWidth = window.innerWidth;
      this.getScreenHeight = window.innerHeight;
  }
  
  @HostListener('window:resize', ['$event'])
  onWindowResize() {
    this.getScreenWidth = window.innerWidth;
    this.getScreenHeight = window.innerHeight;
    if(this.getScreenWidth <= 390)
      this.isMobile = true;
    else
      this.isMobile = false;
    this.annonceService.isMobile$.next(this.isMobile);
  }

}
