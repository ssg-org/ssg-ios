//
//  SyncData.m
//  ssg-ios
//
//  Created by Haris Dautovic on 29/03/14.
//  Copyright (c) 2014 SSG. All rights reserved.
//

#import "SyncData.h"
#import "AppDelegate.h"
#import "City.h"
#import "Faq.h"

@implementation SyncData


static SyncData *__mainData;

- (id) init {
    self = [super init];
    if (self != nil) {
        AppDelegate * appDelagate  = (AppDelegate *)[UIApplication sharedApplication].delegate;
        NSManagedObjectContext *context =appDelagate.managedObjectContext;
        self.current_issue = [NSEntityDescription
                          insertNewObjectForEntityForName:@"Issue"
                          inManagedObjectContext:context];
        
        
        self.numberOfFacebookRequest=0;
        
        self.faq = [[NSMutableArray alloc]init];
        //init faq
        Faq * faq_obj = [[Faq alloc]init];
        [faq_obj setName:@"Šta je ULICA.BA?"];
        [faq_obj setDescript:@"ULICA.BA je web platforma kreirana za građane Bosne i Hercegovine kako bi probleme sa kojima se svakodnevno susreću u svojim lokalnim zajednicama mogli prijavljivati nadležnim vlastima. Platforma omogućava direktnu komunikaciju između Vas i općinskih vlasti. Vi prijavljujete probleme i diskutujete o njima sa drugima, a općinske vlasti Vam daju povratne informacije o rješavanju istih."];
        
        [self.faq addObject:faq_obj];
        
        
        faq_obj = [[Faq alloc]init];
        [faq_obj setName:@"Ko stoji iza platforme?"];
        [faq_obj setDescript:@"Udruženje Sredi Svoj Grad (SSG), koje je nastalo kao zajednička ideja grupe mladih entuzijasta koji svoje stručno znanje i iskustvo žele staviti u funkciju poboljšanja kvalitete života u lokalnoj zajednici. Obzirom da je misija Udruženja razvoj i promocija informacionih tehnologija koje će doprinijeti u postizanju društveno-korisnih ciljeva, kreirana je platforma koja upravo to i omogućava."];
        [self.faq addObject:faq_obj];
        
        
        faq_obj = [[Faq alloc]init];
        [faq_obj setName:@"Ko finansira platformu?"];
        [faq_obj setDescript:@"Platformu financira Ambasada Sjedinjenih Američkih Država u okviru Democracy Commision Small Grant Programme."];
        [self.faq addObject:faq_obj];
        
        
        faq_obj = [[Faq alloc]init];
        [faq_obj setName:@"Koje probleme mogu prijavljivati na platformi?"];
        [faq_obj setDescript:@"ULICA.BA omogućava prijavu problema koji otežavaju građanima život u lijepom, sigurnom i čistom okruženju. Ukoliko je nešto uništeno, pokvareno, prljavo ili ometa građane u svakodnevnim aktivnostima, te je potreban popravak, čišćenje ili uklanjanje, prijavite to putem platforme. To mogu biti problemi kao što su: \n- prljave ulice \n- neuređena igrališta za djecu i parkovi \n- ilegalna odlagališta otpada \n- rupe na lokanim putevima \n- nepropisno parkirani automobili \n- nepropisno plakatiranje javnih prostora \n- razbijena ulična rasvjeta, itd.  \n\nTakođer, platforma ULICA.BA može biti i Vaš alat za pokretanje inicijativa korisnih za zajednicu, a koje možete podijeliti sa Vašim sugrađanima."];
         
        [self.faq addObject:faq_obj];
        
        faq_obj = [[Faq alloc]init];
        [faq_obj setName:@"Ko može koristiti platformu?"];
        [faq_obj setDescript:@"Platforma je otvorena za sve posjetioce. Bez registracije možete pregledati sve probleme prijavljene širom Bosne i Hercegovine. \nRegistracijom postajete član ULICA.BA, što Vam omogućava prijavljivanje problema, razgovor o istima sa drugim građanima, glasanje i određivanje prioriteta u rješavanju problema, organiziranje zajedničkih akcija i mnoge druge aktivnosti."];
        [self.faq addObject:faq_obj];
        
        
        faq_obj = [[Faq alloc]init];
        [faq_obj setName:@"Kako prijavljujem problem?"];
        [faq_obj setDescript:@"Da biste prijavili problem potrebno je da se prijavite. Ukoliko niste član potrebno je da se registrujete. Problem prijavljujete klikom na „PRIJAVI PROBLEM“ na glavnom meniju koji će Vam otvoriti formu za kreiranje problema. Problem kreirate tako što: unesete naslov problema, odredite kojoj kategoriji pripada, izaberete općinu u kojoj prijavljujete probleme, locirate problem klikom na mapu opišete isti ukratko i upotpunite slikom."];
        [self.faq addObject:faq_obj];
        
        
        faq_obj = [[Faq alloc]init];
        [faq_obj setName:@"Kako odrediti kojoj kategoriji pripada problem koji prijavljujem?"];
        [faq_obj setDescript:@"Kada prijavljujete problem potrebno je da odredite kojoj kategoriji pripada kako bi isti bio prijavljen odgovarajućem sektoru unutar općine. \n\nPonuđene kategorije su: \n- Komunalna infrastruktura \n   Komunalna higijena (Primjeri: smeće na ulicama, rijeke i obale rijeka, komunalna inspekcija, javni toaleti, čišćenje snijega) \n   Javna rasvjeta (Primjeri: razbijena lampa, nedostak rasvjete) \n   Vodovod i kanalizacija (Primjeri: vodovodne cijevi, šahtovi, zamjena vodomjera ) \n- Saobraćaj i parking(Primjer: nepropisno parkiranje, uništen ili opasan put ili pločnik, neobilježen pješački prijelaz, saobraćajna signalizacija) \n   Javni prijevoz (Primjeri: stajališta,sredstva javnog prijevoza) \n- Zelene i rekreativne povrsine (Primjer: parkovi,igrališta,sporstki tereni) \n- Zdravlje i sigurnost građana (Primjeri: zagađenje zraka, psi lutalice, curenje plina) \n- Lice grada (Primjeri: obrušene fasade, grafiti, nepropisno plakatiranje) \n- Ostalo"];
        [self.faq addObject:faq_obj];
        
        
        faq_obj = [[Faq alloc]init];
        [faq_obj setName:@"Ko može kreirati problem?"];
        [faq_obj setDescript:@"Samo registrovani članovi mogu kreirati probleme."];
        [self.faq addObject:faq_obj];
        
        
        
    }
    return self;
}

+ (SyncData*)get
{
    if (__mainData == nil) {
        __mainData = [[super allocWithZone:NULL] init];
        
    }
    return __mainData;
}



@end
